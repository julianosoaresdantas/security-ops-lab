#!/bin/bash
# Script de simulacao de exercicio Purple Team
echo "[*] Iniciando exercicio de simulacao Purple Team..."
echo "[*] Etapa 1: Simulacao de varredura de portas controlada."
nc -z -v -w1 127.0.0.1 21 22 80 443 2>&1
echo "[*] Etapa 2: Gerando logs de teste para validacao do SIEM/Log Collector."
logger -p local0.warn "[PURPLE-TEAM-DRILL] Alerta de teste gerado para validacao de regras de detecção."
echo "[*] Exercicio concluido com sucesso."
