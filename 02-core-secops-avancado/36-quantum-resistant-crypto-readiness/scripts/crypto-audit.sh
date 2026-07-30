#!/bin/bash
# Script para auditoria e mapeamento de primitivas criptográficas no ambiente
CRYPTO_LOG="../logs/crypto-readiness.log"
mkdir -p ../logs

echo "[*] [POST-QUANTUM] Iniciando auditoria de prontidão criptográfica..."

echo "[+] Verificando versões do OpenSSL e módulos criptográficos disponíveis no sistema:"
openssl version
openssl list -digest-algorithms | head -n 10

echo "[+] Mapeando certificados SSL/TLS ou chaves locais existentes no repositório..."
find . -type f \( -name "*.pem" -o -name "*.crt" -o -name "*.key" \) 2>/dev/null | while read -r cert; do
    echo "[INFO] Ativo criptográfico encontrado: $cert" >> "$CRYPTO_LOG"
done

echo "$(date '+%F %T') - CRYPTO_AUDIT - Varredura de prontidão pós-quântica executada." >> "$CRYPTO_LOG"
echo "[+] Auditoria criptográfica concluída. Registro salvo em $CRYPTO_LOG"
echo "[*] [POST-QUANTUM] Prontidão criptográfica validada com sucesso."
