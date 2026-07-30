#!/bin/bash
# Script de automação SOAR simplificado para bloqueio de IPs maliciosos via iptables
TARGET_IP="$1"

if [ -z "$TARGET_IP" ]; then
    echo "[-] Uso: $0 <IP_MALICIOSO>"
    exit 1
fi

echo "[*] [SOAR-AUTOMATION] Alerta recebido. Iniciando contenção para o IP: $TARGET_IP"
# Simula a adição da regra no iptables (requer privilégios root)
sudo iptables -A INPUT -s "$TARGET_IP" -j DROP
echo "[*] [SOAR-AUTOMATION] O IP $TARGET_IP foi bloqueado com sucesso no iptables."
echo "$(date) - IP bloqueado: $TARGET_IP" >> ../logs/soar-actions.log
