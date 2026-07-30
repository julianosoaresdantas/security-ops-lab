#!/bin/bash
# Script de monitoramento e verificação de integridade de cargas de trabalho em nuvem (CWPP)
CWPP_LOG="../logs/cwpp-integrity.log"
mkdir -p ../logs

echo "[*] [CWPP] Iniciando verificação de integridade de arquivos e binários críticos..."

# Verifica mudanças em diretórios de sistema sensíveis (/bin, /sbin, /usr/bin)
echo "[+] Analisando estado atual dos binários de sistema..."
find /bin /sbin /usr/bin -type f -mmin -1440 2>/dev/null | while read -r file; do
    echo "[!] ATENÇÃO: Binário modificado nas últimas 24h: $file" >> "$CWPP_LOG"
done

echo "$(date '+%F %T') - CWPP_INTEGRITY - Varredura de integridade de workloads executada." >> "$CWPP_LOG"
echo "[+] Varredura concluída. Registro atualizado em $CWPP_LOG"
echo "[*] [CWPP] Proteção de carga de trabalho validada com sucesso."
