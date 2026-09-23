from django import forms

from user.models import registrationmodel, uploadmodel


class registrationform(forms.ModelForm):
    loginid = forms.CharField(widget=forms.TextInput(), required=True, max_length=100)
    password = forms.CharField(widget=forms.PasswordInput(), required=True, max_length=100)
    email = forms.EmailField(widget=forms.TextInput(),required=True)
    mobile = forms.CharField(widget=forms.TextInput(),required=True,max_length=100)
    place = forms.CharField(widget=forms.TextInput(),required=True,max_length=100)
    city = forms.CharField(widget=forms.TextInput(),required=True,max_length=100)
    authkey = forms.CharField(widget=forms.HiddenInput(), initial='waiting', max_length=100)
    status = forms.CharField(widget=forms.HiddenInput(), initial='waiting', max_length=100)

    class Meta:
        model = registrationmodel
        fields = ['loginid','password','email','mobile','place','city','authkey','status' ]


class UploadfileForm(forms.ModelForm):
    class Meta:
        model = uploadmodel
        fields = ('filename','file')