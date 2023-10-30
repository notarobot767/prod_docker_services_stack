#!/bin/bash

KEY=prime256v1
#list all ec curves
  #openssl ecparam -list_curves
#p-256, current popular standard for web keys. most compatible
#other popular EC keys for web: prime256v1, secp384r1, secp521r1

CA_CERT_FILE=./_ca/ca.pem.crt
CA_KEY_FILE=./_ca/ca.pem.key
CERT_DIR=./srv_certs/$1
CSR_FILE=$CERT_DIR/$1.pem.csr
CERT_FILE=$CERT_DIR/$1.pem.crt
KEY_FILE=$CERT_DIR/$1.pem.key
CERT_CHAIN_FILE=$CERT_DIR/$1-chain.pem.crt
CONF_FILE=./ext/$1.conf
EXT_FILE=./ext/$1-ext.conf
DAYS=3652
  #10 years

rm -rf $CERT_DIR
mkdir -p $CERT_DIR
#remove key & cert if exist

openssl ecparam -genkey -name $KEY -noout -out $KEY_FILE
chmod 400 $KEY_FILE
#create new key

openssl req -new -nodes \
  -key $KEY_FILE -out $CSR_FILE \
  -config $CONF_FILE -extensions req_ext
chmod 444 $CSR_FILE
#create new csr
#ensure csr is ready only

echo signing certificate...
openssl x509 -req -days $DAYS -sha512 -CAcreateserial \
  -in $CSR_FILE -CA $CA_CERT_FILE -CAkey $CA_KEY_FILE \
  -out $CERT_FILE -extfile $EXT_FILE -extensions req_ext
chmod 444 $CERT_FILE
echo
#sign the certificate

cat $CERT_FILE $CA_CERT_FILE > $CERT_CHAIN_FILE
chmod 444 $CERT_CHAIN_FILE
#create certificate chain

openssl x509 -text -noout -in $CERT_FILE
#output cert to screen

echo
echo verifying cert is in CA chain...
openssl verify -verbose -CAfile $CA_CERT_FILE $CERT_FILE
#verify cert is in chain
