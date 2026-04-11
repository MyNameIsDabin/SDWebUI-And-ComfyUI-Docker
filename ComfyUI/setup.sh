#!/bin/bash

# ComfyUI 호스트 폴더 설정

sudo mkdir -p /app/models/{Stable-diffusion,Lora,VAE,ControlNet,ESRGAN,clip,clip_vision,unet}
sudo mkdir -p /app/embeddings
sudo mkdir -p /app/outputs
sudo mkdir -p /app/inputs

sudo chmod -R 777 /app/models
sudo chmod -R 777 /app/embeddings
sudo chmod -R 777 /app/outputs
sudo chmod -R 777 /app/inputs
