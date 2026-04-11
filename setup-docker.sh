#!/bin/bash
set -e

echo "========================================"
echo " Docker 설치 시작"
echo "========================================"

echo ""
echo "[1/4] 패키지 목록 업데이트..."
sudo apt-get update

echo ""
echo "[2/4] 필수 패키지 설치..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

echo ""
echo "[3/4] Docker GPG 키 등록..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo ""
echo "[4/4] Docker Engine 설치..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo ""
echo "========================================"
echo " Docker 설치 완료"
echo "========================================"
echo ""
echo "  docker version: $(docker --version)"
echo ""
