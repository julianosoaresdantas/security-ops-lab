#!/bin/bash
# Script de verificação de postura de segurança para aderência ao modelo Zero Trust
echo "[*] [ZERO-TRUST] Iniciando checagem de postura do host..."

echo "[+] Verificando status do Firewall (UFW / iptables):"
if command -v ufw &> /dev/null; then
    sudo ufw status
else
    sudo iptables -L -n | head -n 10
fi

echo "[+] Verificando serviços ouvindo em portas de rede (evitar exposição desnecessária):"
ss -tulpn | grep LISTEN

echo "[+] Verificando usuários ativos com acesso ao sistema:"
who

echo "[*] [ZERO-TRUST] Verificação de postura concluída."
