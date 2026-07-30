#!/bin/bash
# Script de simulação de tráfego de comando e controle (C2) / exfiltração controlada
TARGET_IP="${1:-127.0.0.1}"
TARGET_PORT="${2:-4444}"

echo "[*] [ADVERSARY-SIM] Iniciando teste de resiliência de rede..."
echo "[*] [ADVERSARY-SIM] Tentando conectar na porta de teste ${TARGET_PORT} em ${TARGET_IP}..."

# Teste de conexão nc simulando beaconing ou tentativa de canal reverso controlado
nc -z -v -w2 "$TARGET_IP" "$TARGET_PORT" 2>&1

echo "[*] [ADVERSARY-SIM] Verificando se as regras de firewall capturaram ou registraram a tentativa..."
if command -v dmesg &> /dev/null; then
    sudo dmesg | tail -n 10 | grep -iE "drop|reject|iptables" || echo "[*] Nenhum bloqueio recente no dmesg para esta porta."
fi

echo "[*] [ADVERSARY-SIM] Simulação concluída. Analise os logs do sistema ou do SIEM para validar a detecção."
