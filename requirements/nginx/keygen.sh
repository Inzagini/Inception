#!/bin/bash

DIR="./srcs/requirements/nginx/ssl"
mkdir -p "$DIR"

KEY_FILE="$DIR/test.key"
CERT_FILE="$DIR/test.crt"

echo "Generatig certificates..."

openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout "$KEY_FILE" \
	-out "$CERT_FILE" \
	-subj "/C=US/ST=State/L=City/O=Org/CN=quannguy.42.fr"

echo "✅ Certificates created:"
echo "  - Key:  $KEY_FILE"
echo "  - Cert: $CERT_FILE"
