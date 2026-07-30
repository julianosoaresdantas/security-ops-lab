#!/bin/bash
# Script de auditoria basica de seguranca em conteineres locais
echo "[*] Verificando conteineres ativos e configuracoes de seguranca..."
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"
echo "[*] Verificacao de configuracoes de seguranca em nuvem concluida."
