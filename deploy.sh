#!/bin/bash

# 设置变量
IMAGE_NAME="nice-chat"
CONTAINER_NAME="nice-chat"
PORT=3210

echo "构建新的 Docker 镜像..."
docker build -t $IMAGE_NAME:latest .

# 检查是否有正在运行的容器
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "停止并删除已有的容器..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

echo "启动新的容器..."
docker run -it -d -p $PORT:$PORT --env-file .env --name $CONTAINER_NAME $IMAGE_NAME:latest

echo "部署完成，容器正在运行。"
