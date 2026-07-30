#!/bin/bash
# Script controlado para simular teste de conectividade e varredura leve para gatilho de IDS
echo "[*] Iniciando simulacao controlada de trafego..."
nc -zv 127.0.0.1 22 80 443 || true
echo "[*] Simulacao concluida."
