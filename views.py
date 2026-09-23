import nltk
from PIL import Image
from django.conf import settings
from django.shortcuts import render, HttpResponseRedirect, redirect
from django.contrib import messages
# Create your views here.
from nltk import word_tokenize
from nltk.corpus import wordnet as wn

from user.forms import registrationform, UploadfileForm
from user.models import registrationmodel, uploadmodel
from msilib.schema import File
from nltk.corpus import wordnet

import numpy as np
import argparse
import time
import cv2
import os

def index(request):
    return render(request,"index.html")

def base(request):
    return render(request, "base.html")

def registration(request):
        if request.method == 'POST':
            form = registrationform(request.POST)
            if form.is_valid():
                # print("Hai Meghana")
                form.save()
                messages.success(request, 'you are successfully registred')
                return HttpResponseRedirect('trainer')
            else:
                print('Invalid')
        else:
            form = registrationform()
        return render(request, "user/registration.html", {'form': form})

def userhome(request):
    return render(request, "user/userhome.html")

def user(request):
    return render(request, "user/user.html")

def userlogincheck(request):
    if request.method == 'POST':
        usid = request.POST.get('loginid')
        print(usid)
        pswd = request.POST.get('password')
        print(pswd)
        try:
            check = registrationmodel.objects.get(loginid=usid, password=pswd)
           # print('usid',usid,'pswd',pswd)
            request.session['userid'] = check.loginid
            status = check.status
            if status == "activated":
                request.session['email'] = check.email
                #auth.login(request, usid)
                return render(request,'user/userpage.html')
            else:
                messages.success(request, 'user is not activated')
                return render(request,'user/user.html')

        except Exception as e:
            print('Exception is ', str(e))
            messages.success(request,'Invalid user id and password')
        return render(request,'user/user.html')

def uploadfile(request):
        if request.method == 'POST':
            form = UploadfileForm(request.POST, request.FILES)
            if form.is_valid():
                form.save()
                return redirect('user/upload_list.html')
        else:
            form = UploadfileForm()
        return render(request, 'user/uploadfile.html', {'form': form})

def upload_list(request):
        files = File.objects.all()
        return render(request, 'upload_list.html', {'files': files})

def viewuserfiles(request):
        filedata = uploadmodel.objects.all()
        return render(request, 'user/viewuserdata.html', {'object': filedata})

def findvocabulary(request):
    if request.method == "GET":
        file = request.GET.get('id')
        try:
            #check = uploadmodel.objects.get(id=usid)
            #file = check.file
            print("Path is ", settings.MEDIA_ROOT+'/'+file)
            raw = open(settings.MEDIA_ROOT+'/'+file).read()
            #print(raw)
            tokens = word_tokenize(raw)
            #print(tokens)
            words = set(w.lower() for w in nltk.corpus.words.words())
            # tokens1 = word_tokenize(words)
            tokens1 = list(words)
            # print(tokens1)
            voc = set(tokens) & set(tokens1)
            meg = str(voc)
            #print('Word type ',meg)
            word = meg.split(",")
            for x in word:
                #print('X = ',x)
                line = nltk.re.sub('[^ a-zA-Z0-9]', '', x)
                #print("Line ", line)
            for x in line:
                sysns = wn.synsets(x)
                #print('Rslt ',sysns)
            #texts = [[word.lower() for word in text.split()] for text in voc]
            #syns = wn.synsets(meg)
            #print("synsets:", syns)

            dict = {
                "file": file,
                "voc": voc,
                "sysns": sysns,

            }
            #print(dict)
            katti = {}
            vcData = dict['voc']
            #print(vcData)

            try:
                for xword in vcData:
                    #print('for NLTK  =',xword)
                    syn =  wordnet.synsets(xword)
                    if len(syn) !=0:
                        description = syn[0].definition()
                        katti.update({xword:description})
                    else:
                        pass
            except Exception as e:
                print(e)
                pass

            #print('katti type ',katti)
            dict1 = {
                "katti": katti,
                'dict':dict

            }
            #print("dict1:",dict1)
            #return render(request, "user/vocabulary.html",{'dict':dict,'katti':katti})
            #return render(request, "user/vocabulary.html", katti)
            return render(request, "user/vocabulary.html", dict1)
        except Exception as e:
            print('Exception is ', str(e))
            messages.success(request, 'Invalid Details')
        return render(request, 'user/viewuserdata.html')

def detection(request):
    if request.method == 'POST':
        images = request.FILES.get('imgfile')
        print("image:",images)
        img = Image.open(images)
        #print("meghana:", img)
        image = img.save(settings.MEDIA_ROOT + "/cropped_picture.jpg")
        args = {'yolo': 'yolo-coco', 'confidence': 0.5, 'threshold': 0.3}  # vars(ap.parse_args())
        print("Volvorine Args ", type(args))
        args.update({'image': image})
        print("Dict Data ", args)
        # load the COCO class labels our YOLO model was trained on
        labelsPath = os.path.sep.join(["yolo-coco/coco.names"])
        LABELS = open(labelsPath).read().strip().split("\n")

        # initialize a list of colors to represent each possible class label
        np.random.seed(42)
        COLORS = np.random.randint(0, 255, size=(len(LABELS), 3), dtype="uint8")

        # derive the paths to the YOLO weights and model configuration
        weightsPath = os.path.sep.join(["yolo-coco/yolov3.weights"])
        configPath = os.path.sep.join(["yolo-coco/yolov3.cfg"])

        # load our YOLO object detector trained on COCO dataset (80 classes)
        print("[INFO] loading YOLO from disk...")
        net = cv2.dnn.readNetFromDarknet(configPath, weightsPath)

        # load our input image and grab its spatial dimensions
        # image = "F:/Python/Alex Codes/yolo-object-detection/images/soccer.jpg"
        # image = cv2.imread(args["image"])
        image = cv2.imread(settings.MEDIA_ROOT+"/cropped_picture.jpg")
        print("images:",image)
        (H, W) = image.shape[:2]

        # determine only the *output* layer names that we need from YOLO
        ln = net.getLayerNames()
        ln = [ln[i[0] - 1] for i in net.getUnconnectedOutLayers()]

        # construct a blob from the input image and then perform a forward
        # pass of the YOLO object detector, giving us our bounding boxes and
        # associated probabilities
        blob = cv2.dnn.blobFromImage(image, 1 / 255.0, (416, 416),
                                     swapRB=True, crop=False)
        net.setInput(blob)
        start = time.time()
        layerOutputs = net.forward(ln)
        end = time.time()

        # show timing information on YOLO
        print("[INFO] YOLO took {:.6f} seconds".format(end - start))

        # initialize our lists of detected bounding boxes, confidences, and
        # class IDs, respectively
        boxes = []
        confidences = []
        classIDs = []

        # loop over each of the layer outputs
        for output in layerOutputs:
            # loop over each of the detections
            for detection in output:
                # extract the class ID and confidence (i.e., probability) of
                # the current object detection
                scores = detection[5:]
                classID = np.argmax(scores)
                confidence = scores[classID]

                # filter out weak predictions by ensuring the detected
                # probability is greater than the minimum probability
                if confidence > args["confidence"]:
                    # scale the bounding box coordinates back relative to the
                    # size of the image, keeping in mind that YOLO actually
                    # returns the center (x, y)-coordinates of the bounding
                    # box followed by the boxes' width and height
                    box = detection[0:4] * np.array([W, H, W, H])
                    (centerX, centerY, width, height) = box.astype("int")

                    # use the center (x, y)-coordinates to derive the top and
                    # and left corner of the bounding box
                    x = int(centerX - (width / 2))
                    y = int(centerY - (height / 2))

                    # update our list of bounding box coordinates, confidences,
                    # and class IDs
                    boxes.append([x, y, int(width), int(height)])
                    confidences.append(float(confidence))
                    classIDs.append(classID)

        # apply non-maxima suppression to suppress weak, overlapping bounding
        # boxes
        idxs = cv2.dnn.NMSBoxes(boxes, confidences, args["confidence"],
                                args["threshold"])

        # ensure at least one detection exists
        if len(idxs) > 0:
            # loop over the indexes we are keeping
            for i in idxs.flatten():
                # extract the bounding box coordinates
                (x, y) = (boxes[i][0], boxes[i][1])
                (w, h) = (boxes[i][2], boxes[i][3])

                # draw a bounding box rectangle and label on the image
                color = [int(c) for c in COLORS[classIDs[i]]]
                cv2.rectangle(image, (x, y), (x + w, y + h), color, 2)
                text = "{}: {:.4f}".format(LABELS[classIDs[i]], confidences[i])
                cv2.putText(image, text, (x, y - 5), cv2.FONT_HERSHEY_SIMPLEX,
                            0.5, color, 2)

        # show the output image
        cv2.imshow("Image", image)
        cv2.waitKey(0)
        return render(request,"user/objectdetect.html")



def imagedetect(request):
    return render(request, "user/imagedetect.html")

