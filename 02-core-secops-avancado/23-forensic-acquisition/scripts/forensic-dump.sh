#!/bin/bash
# Script para coleta automatizada de evidências voláteis para análise forense
EVIDENCE_DIR="../evidence/dump-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$EVIDENCE_DIR"

echo "[*] [FORENSIC] Iniciando coleta de evidências voláteis..."

echo "[+] Coletando conexões de rede ativas..."
ss -tulpn > "$EVIDENCE_DIR/network-connections.txt"
netstat -an > "$EVIDENCE_DIR/netstat.txt" 2>/dev/null

echo "[+] Coletando processos em execução..."
ps auxf > "$EVIDENCE_DIR/running-processes.txt"

echo "[+] Coletando usuários logados atualmente..."
w > "$EVIDENCE_DIR/logged-users.txt"
last > "$EVIDENCE_DIR/last-logins.txt"

echo "[+] Coletando tabela de roteamento..."
route -n > "$EVIDENCE_DIR/routing-table.txt" 2>/dev/null

echo "[*] [FORENSIC] Coleta finalizada com sucesso. Evidências salvas em: $EVIDENCE_DIR"
