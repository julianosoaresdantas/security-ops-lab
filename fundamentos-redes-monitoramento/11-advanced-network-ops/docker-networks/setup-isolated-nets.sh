#!/bin/bash
# Criação de redes Docker isoladas para microsegmentação
echo "[*] Criando redes Docker isoladas (DMZ e Internal Backend)..."
docker network create --driver bridge --subnet=172.28.10.0/24 dmz-net
docker network create --driver bridge --internal internal-backend-net
echo "[*] Redes isoladas criadas com sucesso."
