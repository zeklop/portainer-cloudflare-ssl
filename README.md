# Portainer Cloudflare Domain SSL

Сохраните и запустите скрипт:
nano install-portainer.sh
chmod +x install-portainer.sh

В случае необходимости откройте порт:
sudo ufw allow 2083/tcp

Cloudflare:
В разделе DNS добавьте нужный домен и включите проксирование (оранжевое облако).
В разделе SSL выпустите клиентский сертификат *.crt и ключ *.key, привяжите их к домену.
В настройках Portainer загрузите полученные файлы.

После этого Portainer будет доступен по адресу: 
https://portainer.yourdomain.com:2083


Список портов, которые поддерживает Cloudflare proxy:
HTTPS 443, 2053, 2083, 2087, 2096, 8443
