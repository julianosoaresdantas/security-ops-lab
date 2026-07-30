#!/bin/bash
# Script rápido de triagem e coleta de artefatos para Resposta a Incidentes
echo "[*] Iniciando coleta de triagem de incidentes..."
date > logs/triage-report.txt
uname -a >> logs/triage-report.txt
ss -tulnp >> logs/triage-report.txt
ps aux >> logs/triage-report.txt
echo "[*] Relatorio de triagem salvo em logs/triage-report.txt"
