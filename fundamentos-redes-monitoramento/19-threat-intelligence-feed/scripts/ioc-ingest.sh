#!/bin/bash
# Script para ingestão e aplicação automatizada de IOCs maliciosos (IPs)
FEED_FILE="../indicators/malicious-ips.txt"

echo "[*] [THREAT-INTEL] Iniciando sincronização de IOCs..."

if [ ! -f "$FEED_FILE" ]; then
    echo "[-] Arquivo de feed de IOCs não encontrado em $FEED_FILE. Criando exemplo..."
    mkdir -p ../indicators
    echo "198.51.100.45" > "$FEED_FILE"
    echo "203.0.113.88" >> "$FEED_FILE"
fi

echo "[+] Lendo IPs maliciosos do feed de inteligência..."
while IFS= read -r ip; do
    # Ignora linhas vazias ou comentários
    [[ -z "$ip" || "$ip" =~ ^# ]] && continue
    
    echo "[*] Aplicando regra de bloqueio para o IOC: $ip"
    sudo iptables -C INPUT -s "$ip" -j DROP 2>/dev/null || sudo iptables -A INPUT -s "$ip" -j DROP
done < "$FEED_FILE"

echo "[*] [THREAT-INTEL] Sincronização de IOCs concluída com sucesso."
