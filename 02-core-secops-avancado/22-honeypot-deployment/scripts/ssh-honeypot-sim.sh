#!/bin/bash
# Simulador de armadilha SSH (Honeypot leve) para captura de credenciais e tentativas de acesso
HONEYPOT_LOG="../logs/honeypot-ssh.log"
mkdir -p ../logs

echo "[*] [HONEYPOT] Iniciando escuta simulada na porta SSH (2222)..."
echo "[*] [HONEYPOT] Aguardando conexões de atacantes..."

# Simula um socket ouvindo e registrando tentativas de conexão na porta 2222
while true; do
    nc -l -p 2222 -c 'echo "SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.5"; read -t 3 input; echo "Access denied."; echo "$(date "+%F %T") - Tentativa de conexão recebida de $RECFROM com entrada: $input" >> '"$HONEYPOT_LOG"'' 2>/dev/null
    sleep 1
done
