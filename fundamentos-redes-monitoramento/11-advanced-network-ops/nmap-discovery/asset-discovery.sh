#!/bin/bash
# Script automatizado de descoberta de ativos e inventário de rede
TARGET="${1:-192.168.1.0/24}"
echo "[*] Iniciando varredura de descoberta de ativos em: $TARGET"
nmap -sn "$TARGET" -oN ../logs/nmap-discovery-report.txt
echo "[*] Inventário inicial concluído e salvo em logs/nmap-discovery-report.txt"
