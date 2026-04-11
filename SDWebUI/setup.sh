#!/bin/bash
set -e

echo "========================================"
echo " SDWebUI 호스트 폴더 설정 시작"
echo "========================================"

DIRS=(
    /app/models/Stable-diffusion
    /app/models/Lora
    /app/extensions
    /app/embeddings
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
sudo chmod -R 777 /app/extensions
sudo chmod -R 777 /app/models
sudo chmod -R 777 /app/embeddings

echo ""
echo "========================================"
echo " SDWebUI 호스트 폴더 설정 완료"
echo "========================================"
echo ""
echo "  다음 단계:"
echo "    docker build -t sd-webui ."
echo "    docker run --gpus all -d -p 7860:7860 \\"
echo "      -v /app/models/Stable-diffusion:/app/stable-diffusion-webui/models/Stable-diffusion \\"
echo "      -v /app/models/Lora:/app/stable-diffusion-webui/models/Lora \\"
echo "      -v /app/extensions:/app/stable-diffusion-webui/extensions \\"
echo "      -v /app/embeddings:/app/stable-diffusion-webui/embeddings \\"
echo "      --restart always --name sd-webui sd-webui"
echo ""
