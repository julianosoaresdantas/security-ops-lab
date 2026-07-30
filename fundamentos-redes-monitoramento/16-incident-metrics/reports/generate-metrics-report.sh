#!/bin/bash
# Script de geração de relatório consolidado de métricas do SOC
REPORT_FILE="../logs/soc-metrics-report-$(date +%F).txt"

echo "==================================================" > "$REPORT_FILE"
echo " RELATÓRIO DE MÉTRICAS DO SECURITY OPERATIONS LAB" >> "$REPORT_FILE"
echo " Data: $(date)" >> "$REPORT_FILE"
echo "==================================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "[+] Total de módulos ativos no laboratório: 16" >> "$REPORT_FILE"
echo "[+] Status do Firewall (iptables):" >> "$REPORT_FILE"
sudo iptables -L -n | head -n 15 >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "[+] Conexões ativas monitoradas:" >> "$REPORT_FILE"
ss -tupn | head -n 10 >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Relatório gerado com sucesso em $REPORT_FILE"

cat "$REPORT_FILE"
