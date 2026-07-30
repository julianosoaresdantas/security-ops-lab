#!/bin/bash
# Script basico de verificacao de conformidade e integridade
echo "[*] Iniciando auditoria de conformidade..."
echo "--- Verificando usuarios com UID 0 ---" > logs/compliance-report.txt
awk -F: '($3 == 0) {print $1}' /etc/passwd >> logs/compliance-report.txt
echo "--- Verificando permissoes do /etc/passwd ---" >> logs/compliance-report.txt
ls -l /etc/passwd >> logs/compliance-report.txt
echo "[*] Auditoria concluida. Relatorio gerado."
