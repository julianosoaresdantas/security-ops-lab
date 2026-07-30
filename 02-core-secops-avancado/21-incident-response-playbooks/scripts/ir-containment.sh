#!/bin/bash
# Script automatizado para isolamento e contenção de emergência em caso de incidente
echo "[!] [IR-SOAR] Acionando protocolo de contenção de incidentes..."

if [ -z "$1" ]; then
    echo "[-] Uso correto: $usuario ou $0 <IP_SUSPEITO_OU_HOST>"
    echo "[-] Exemplo: $0 198.51.100.45"
    exit 1
fi

TARGET="$1"
echo "[*] Isolate/Block acionado para o alvo: $TARGET"

# Aplica regra de bloqueio imediato no firewall
sudo iptables -A INPUT -s "$TARGET" -j DROP
sudo iptables -A OUTPUT -d "$TARGET" -j DROP

echo "[+] Alvo $TARGET isolado com sucesso via iptables."
echo "[*] [IR-SOAR] Registrando evento de contenção no log de incidentes..."
echo "$(date '+%F %T') - CONTENÇÃO EXECUTADA - Alvo bloqueado: $TARGET" >> ../logs/incident-response.log
