#!/bin/bash
# Script de monitoramento e visibilidade de tráfego DNS
INTERFACE="${1:-eth0}"
echo "[*] Capturando consultas DNS na interface $INTERFACE..."
tcpdump -i "$INTERFACE" -nn port 53 -c 20
echo "[*] Amostra de tráfego DNS coletada."
