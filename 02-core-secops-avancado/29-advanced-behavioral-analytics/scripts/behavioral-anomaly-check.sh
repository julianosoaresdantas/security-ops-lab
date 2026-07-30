#!/bin/bash
# Script de análise comportamental avançada e detecção de anomalias em tempo de execução
ANOMALY_LOG="../logs/behavioral-anomalies.log"
mkdir -p ../logs

echo "[*] [BEHAVIORAL-ANALYTICS] Iniciando varredura heurística de desvios comportamentais..."

echo "[+] Verificando picos de uso de CPU por processos não root:"
ps -eo user,pid,%cpu,%mem,comm --sort=-%cpu | head -n 6 | awk 'NR>1 {print "[INFO] Top Uso: " $0}'

echo "[+] Verificando conexões TCP em estado SYN_RECV (possível varredura/SYN flood):"
SYN_COUNT=$(ss -t state SYN-RECV | wc -l)
echo "[INFO] Contagem atual de conexões SYN_RECV: $SYN_COUNT"
if [ "$SYN_COUNT" -gt 10 ]; then
    echo "[!] ALERTA: Possível anomalia de varredura ou SYN flood detectada! Contagem: $SYN_COUNT" >> "$ANOMALY_LOG"
fi

echo "[*] [BEHAVIORAL-ANALYTICS] Análise comportamental concluída com sucesso."
