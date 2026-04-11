#!/bin/bash

# ComfyUI Docker 설정 스크립트
# 기존 SD WebUI (/app/models/) 환경에 ComfyUI 추가

echo "🎨 ComfyUI Docker 환경 설정 시작..."
echo ""

# 추가 모델 폴더 생성 (기존에 없을 수 있는 폴더들)
echo "📁 추가 모델 폴더 생성 중..."
sudo mkdir -p /app/models/{VAE,ControlNet,ESRGAN,clip,clip_vision,unet}
sudo mkdir -p /app/outputs
sudo mkdir -p /app/inputs

# 권한 설정
echo "🔐 권한 설정 중..."
sudo chmod -R 777 /app/models
sudo chmod -R 777 /app/outputs
sudo chmod -R 777 /app/inputs

echo ""
echo "✅ 설정 완료!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📂 모델 폴더 매핑:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  SD WebUI 경로              →  ComfyUI 경로"
echo "  ─────────────────────────────────────────────────"
echo "  /app/models/Stable-diffusion  →  checkpoints"
echo "  /app/models/Lora              →  loras"
echo "  /app/models/VAE               →  vae"
echo "  /app/models/ControlNet        →  controlnet"
echo "  /app/models/ESRGAN            →  upscale_models"
echo "  /app/embeddings               →  embeddings"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🚀 실행 방법:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  # 빌드 & 실행"
echo "  docker compose up -d --build"
echo ""
echo "  # 로그 확인"
echo "  docker compose logs -f comfyui"
echo ""
echo "  # 중지"
echo "  docker compose down"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🌐 접속 주소:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  http://localhost:8188"
echo "  http://<서버IP>:8188"
echo ""