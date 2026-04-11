# Stable Diffusion Docker

AWS Ubuntu + NVIDIA GPU 환경에서 SD WebUI / ComfyUI를 Docker로 실행하기 위한 구성입니다.

## 사전 조건

- Ubuntu (22.04 권장)
- NVIDIA 드라이버 + CUDA 설치 완료 (`nvidia-smi`로 확인)
- NVIDIA Container Toolkit 설치 완료

## 실행 순서

```bash
git clone <repo-url>
cd StableDiffusionDocker

# Docker 미설치 시 (최초 1회)
bash setup-docker.sh
```

### SDWebUI

```bash
cd SDWebUI
bash setup.sh
docker build -t sd-webui .
docker run --gpus all -d -p 7860:7860 \
    -v /app/models/Stable-diffusion:/app/stable-diffusion-webui/models/Stable-diffusion \
    -v /app/models/Lora:/app/stable-diffusion-webui/models/Lora \
    -v /app/extensions:/app/stable-diffusion-webui/extensions \
    -v /app/embeddings:/app/stable-diffusion-webui/embeddings \
    --restart always --name sd-webui sd-webui
```

접속: `http://<서버IP>:7860`

### ComfyUI

```bash
cd ComfyUI
bash setup.sh
docker compose up -d --build
```

접속: `http://<서버IP>:8188`

## 유용한 명령어

```bash
# 로그 확인
docker logs -f --tail 100 <컨테이너명>

# 컨테이너 중지/제거
docker stop <컨테이너명> && docker rm <컨테이너명>

# 디스크 사용량 확인 (빌드 캐시 등)
docker system df

# 도커 캐시 정리
docker system prune -a -f
```

## 제거 가이드

### SDWebUI 제거

```bash
docker stop sd-webui && docker rm sd-webui   # 컨테이너 제거
docker rmi stable-diffusion-webui            # 이미지 제거
docker system prune -f                       # 캐시 정리
```

### ComfyUI 제거

```bash
cd ComfyUI
docker compose down                          # 컨테이너 제거
docker rmi comfyui-comfyui                   # 이미지 제거
docker system prune -f                       # 캐시 정리
```

> 모델 파일(`/app/models/`)은 호스트에 있으므로 컨테이너를 제거해도 유지됩니다.
> 모델까지 삭제하려면: `sudo rm -rf /app/models /app/embeddings /app/outputs /app/inputs`
