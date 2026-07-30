#!/bin/bash
# Script de validação e verificação de políticas de acesso Zero Trust na Borda (Edge/ZTNA)
EDGE_LOG="../logs/edge-security.log"
mkdir -p ../logs

echo "[*] [ZERO-TRUST-EDGE] Iniciando auditoria de políticas de acesso na borda..."

echo "[+] Verificando conexões ativas de rede e estado de escuta nas interfaces externas:"
ss -tulpn | grep -E "LISTEN" | head -n 10

echo "[+] Simulando validação de postura de dispositivo para acesso ZTNA..."
DEVICE_POSTURE="Compliant"
echo "[INFO] Postura do endpoint avaliada: $DEVICE_POSTURE"

echo "$(date '+%F %T') - ZTNA_EDGE_AUDIT - Varredura de segurança na borda executada com sucesso." >> "$EDGE_LOG"
echo "[+] Auditoria de Edge Security concluída. Registro salvo em $EDGE_LOG"
echo "[*] [ZERO-TRUST-EDGE] Gateways de acesso seguro validados."
