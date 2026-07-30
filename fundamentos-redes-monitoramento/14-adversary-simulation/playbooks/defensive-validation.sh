#!/bin/bash
# Script de validação defensiva para checar o status de proteção do laboratório
echo "[*] [DEFENSIVE-CHECK] Verificando regras ativas no iptables..."
sudo iptables -L -v -n --line-numbers

echo "[*] [DEFENSIVE-CHECK] Verificando conexões de rede ativas e portas escutando..."
ss -tulpn

echo "[*] [DEFENSIVE-CHECK] Auditoria defensiva finalizada com sucesso."
