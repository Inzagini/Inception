<!-- check local connection -->
curl -vk https://localhost

openssl s_client -connect localhost:8788

mkdir -p ./nginx/certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./nginx/certs/selfsigned.key \
  -out ./nginx/certs/selfsigned.crt \
  -subj "/CN=quannguy.42.fr"
