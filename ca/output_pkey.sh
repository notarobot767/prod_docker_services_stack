#!/bin/bash

openssl pkey -pubout -in $1 | openssl md5
openssl x509 -noout -pubkey -in $2 | openssl md5