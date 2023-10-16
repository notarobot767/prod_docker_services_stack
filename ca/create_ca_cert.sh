#!/bin/bash

KEY=prime256v1
#list all ec curves
  #openssl ecparam -list_curves
#p-256, current popular standard for web keys. most compatible
#other popular EC keys for web: prime256v1, secp384r1, secp521r1

CERT_FILE=./_ca/ca.pem.crt
KEY_FILE=./_ca/ca.pem.key
CONF_FILE=./ext/ca.conf
DAYS=3652
  #10 years

rm -rf ./_ca
mkdir ./_ca
#remove key & cert if exist

openssl ecparam -genkey -name $KEY -noout -out $KEY_FILE
chmod 400 $KEY_FILE

openssl req -x509 -new -days $DAYS -noenc \
  -key $KEY_FILE -out $CERT_FILE \
  -config $CONF_FILE -extensions req_ext
chmod 444 $CERT_FILE

openssl x509 -text -noout -in $CERT_FILE
#create new key and cert