#!/bin/bash

# SDWebUI 호스트 폴더 설정

sudo mkdir -p /app/models/Stable-diffusion
sudo mkdir -p /app/models/Lora
sudo mkdir -p /app/extensions
sudo mkdir -p /app/embeddings

sudo chmod -R 777 /app/extensions
sudo chmod -R 777 /app/models
sudo chmod -R 777 /app/embeddings
