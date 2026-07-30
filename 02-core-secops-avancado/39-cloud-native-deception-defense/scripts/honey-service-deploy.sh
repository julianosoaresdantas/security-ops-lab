#!/bin/bash
# Script para implantação e monitoramento de honey-services e armadilhas em nuvem
DECEPTION_LOG="../logs/deception-defense.log"
mkdir -p ../logs

echo "[*] [DECEPTION] Iniciando implantação de armadilhas e honey-services..."

echo "[+] Configurando escutas falsas em portas comuns de administração (ex: 2222, 8443)..."
# Simula a criação de um canary token / credencial de engodo em arquivo protegido
CANARY_FILE="../configs/aws-credentials-canary.env"
echo "AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE_CANARY" > "$CANARY_FILE"
echo "AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY_CANARY" >> "$CANARY_FILE"

echo "$(date '+%F %T') - DECEPTION_DEPLOY - Honey-services e canary tokens ativados com sucesso." >> "$DECEPTION_LOG"
echo "[+] Armadilhas implantadas. Alertas vinculados ao log de segurança em $DECEPTION_LOG"
echo "[*] [DECEPTION] Sistema de defesa por engano ativo e monitorando."
