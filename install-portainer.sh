#!/bin/bash

# Остановка и удаление существующего контейнера Portainer (если есть)
echo "Проверка существующего контейнера Portainer..."
if [ "$(docker ps -aq -f name=portainer)" ]; then
    echo "Остановка существующего контейнера..."
    docker stop portainer
    echo "Удаление существующего контейнера..."
    docker rm portainer
fi

# Запуск Portainer на порту 2083
# Если делаете переустановку существующего Портейнера укажите правильный путь к его базе данных
echo "Запуск Portainer на порту 2083..."
docker run -d \
  -p 2083:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes/portainer_data/_data:/data \
  portainer/portainer-ce:latest

# Проверка статуса
echo ""
echo "Проверка статуса контейнера..."
docker ps -f name=portainer

echo ""
echo "✅ Portainer установлен и запущен!"
echo "🌐 Доступ: https://your-domain.com:2083"
echo "📝 Порт 2083 проксируется через Cloudflare"
echo ""
echo "Не забудьте:"
echo "1. Открыть порт 2083 в файрволе: sudo ufw allow 2083/tcp"
echo "2. Настроить A-запись в Cloudflare DNS"
echo "3. Включить оранжевое облако (Proxy) в Cloudflare"
