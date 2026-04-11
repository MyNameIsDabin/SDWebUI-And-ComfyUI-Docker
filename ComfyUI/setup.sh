#!/bin/bash
set -e

echo "========================================"
echo " ComfyUI 호스트 폴더 설정 시작"
echo "========================================"

DIRS=(
    /app/models/Stable-diffusion
    /app/models/Lora
    /app/models/VAE
    /app/models/ControlNet
    /app/models/ESRGAN
    /app/models/clip
    /app/models/clip_vision
    /app/models/unet
    /app/embeddings
    /app/comfyui/custom_nodes
    /app/comfyui/user
    /app/outputs
    /app/inputs
)

echo ""
for dir in "${DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "[skip] $dir (이미 존재)"
    else
        sudo mkdir -p "$dir"
        echo "[생성] $dir"
    fi
done

echo ""
echo "권한 설정 (chmod 777)..."
sudo chmod -R 777 /app/models
sudo chmod -R 777 /app/embeddings
sudo chmod -R 777 /app/comfyui
sudo chmod -R 777 /app/outputs
sudo chmod -R 777 /app/inputs

echo ""
echo "========================================"
echo " ComfyUI 호스트 폴더 설정 완료"
echo "========================================"
echo ""
echo "  다음 단계:"
echo "    docker compose up -d --build"
echo "    docker system prune -f          # 빌드 캐시 정리"
echo ""
echo "  접속:"
echo "    http://<서버IP>:8188"
echo ""
