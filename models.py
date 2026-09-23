from django.db import models

# Create your models here.

class registrationmodel(models.Model):
    loginid = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    email = models.EmailField()
    mobile = models.CharField(max_length=100)
    place = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    authkey = models.CharField(max_length=100)
    status = models.CharField(max_length=100)

def __str__(self):
    return self.email



class uploadmodel(models.Model):
    filename = models.CharField(max_length=100)
    file = models.FileField(upload_to='files/pdfs/')

    def __str__(self):
        return self.filename