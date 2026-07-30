#!/bin/bash
# Script de Threat Hunting para caça proativa de anomalias e comportamentos suspeitos
echo "[*] [THREAT-HUNT] Iniciando varredura comportamental e analítica..."

echo "[+] Procurando por processos rodando a partir de diretórios temporários (/tmp, /dev/shm):"
ps -eo pid,ppid,cmd --sort=-%cpu | awk '$3 ~ /\/tmp\/|\/dev\/shm\// {print "[!] SUSPEITO: " $0}'

echo "[+] Verificando conexões estabelecidas com portas atípicas ou externas:"
ss -tnp | awk 'NR>1 {print "[INFO] Conexão ativa: " $5 " (Processo: " $6 ")"}'

echo "[+] Verificando alterações recentes em arquivos de configuração crítica (/etc/passwd, /etc/shadow):"
find /etc/passwd /etc/shadow -mmin -1440 2>/dev/null && echo "[!] ATENÇÃO: Arquivos críticos modificados nas últimas 24 horas!" || echo "[OK] Sem modificações recentes em /etc/passwd ou /etc/shadow."

echo "[*] [THREAT-HUNT] Varredura comportamental concluída com sucesso."
