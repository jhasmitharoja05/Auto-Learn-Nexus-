from nltk.corpus import wordnet
syn = wordnet.synsets('be')
#print('Sentance= ',syn)
description = ''

if len(syn)!=0:
    description = syn[0].definition()
    #print(*syn[0].examples())
    print(description)