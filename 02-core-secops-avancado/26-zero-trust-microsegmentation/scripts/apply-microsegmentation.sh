#!/bin/bash
# Script para aplicação de políticas de microsegmentação baseadas em Zero Trust via iptables
echo "[*] [ZERO-TRUST] Iniciando aplicação de políticas de microsegmentação..."

# Define política padrão restritiva para o tráfego de encaminhamento (Forward)
sudo iptables -P FORWARD DROP

# Permite apenas tráfego estabelecido e relacionado
sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Permite comunicação estritamente controlada entre a DMZ e serviços autorizados (exemplo: porta 443)
sudo iptables -A FORWARD -p tcp --dport 443 -j ACCEPT

echo "[+] Políticas de microsegmentação Zero Trust aplicadas com sucesso."
echo "$(date '+%F %T') - MICROSEGMENTAÇÃO APLICADA - Políticas restritivas ativadas" >> ../logs/zero-trust.log
