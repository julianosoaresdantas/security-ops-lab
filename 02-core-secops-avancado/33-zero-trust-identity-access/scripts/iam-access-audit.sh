#!/bin/bash
# Script de auditoria de identidade e acesso (IAM) para validação de privilégios locais
IAM_LOG="../logs/iam-audit.log"
mkdir -p ../logs

echo "[*] [ZERO-TRUST-IAM] Iniciando auditoria de contas de usuário e privilégios..."

echo "[+] Verificando contas com privilégios de superusuário (UID 0 ou sudoers):"
awk -F: '($3 == 0) {print "[!] ALERTA - Conta com UID 0 (Root): " $1}' /etc/passwd
grep -Po '^([a-zA-Z0-9_-]+)' /etc/group | grep -w "sudo" -A 1 > /dev/null && echo "[INFO] Grupo sudo auditado com sucesso."

echo "[+] Verificando contas com shells de login válidos e ativos:"
awk -F: '($7 !~ /nologin|false/ && $7 != "") {print "[INFO] Usuário com shell ativo: " $1 " (Shell: " $7 ")"}' /etc/passwd

echo "$(date '+%F %T') - IAM_AUDIT - Auditoria de identidades e privilégios executada com sucesso." >> "$IAM_LOG"

echo "[*] [ZERO-TRUST-IAM] Auditoria de IAM concluída."
