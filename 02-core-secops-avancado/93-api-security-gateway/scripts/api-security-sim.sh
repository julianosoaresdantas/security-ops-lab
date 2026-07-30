#!/bin/bash
# Simulador de gateway de segurança para APIs e proteção contra vulnerabilidades do OWASP API Top 10
API_LOG="../logs/api-security.log"
mkdir -p ../logs

echo "[*] [API-SECURITY] Inicializando inspetor de tráfego REST/GraphQL e validador de endpoints..."

echo "[+] Analisando cabeçalhos de autorização, assinaturas de tokens JWT e parâmetros de requisição em busca de falhas BOLA..."
echo "[+] Aplicando políticas de limitação de taxa (Rate Limiting) e sanitização estrita de payloads de entrada..."

# Simula detecção e bloqueio de requisição maliciosa na API
echo "$(date '+%F %T') - API_ATTACK_BLOCKED - Tentativa de exploração de endpoint e acesso não autorizado (BOLA) interceptada e bloqueada com sucesso." >> "$API_LOG"

echo "[+] Ciclo de inspeção de API concluído. Registro de auditoria salvo em $API_LOG"
echo "[*] [API-SECURITY] Gateway de proteção de APIs operando em modo de defesa ativa."
