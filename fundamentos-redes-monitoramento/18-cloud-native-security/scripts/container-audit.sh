#!/bin/bash
# Script de auditoria e inspeção de contêineres Docker ativos
echo "[*] [CLOUD-AUDIT] Iniciando auditoria de segurança de contêineres..."

if ! command -v docker &> /dev/null; then
    echo "[-] Docker não está instalado ou não está acessível."
    exit 1
fi

echo "[+] Listando contêineres em execução e suas portas mapeadas:"
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}"

echo "[+] Verificando contêineres rodando com privilégios estendidos (--privileged):"
for container in $(docker ps -q); do
    privileged=$(docker inspect --format='{{.HostConfig.Privileged}}' "$container")
    name=$(docker inspect --format='{{.Name}}' "$container")
    if [ "$privileged" = "true" ]; then
        echo "[!] ALERTA: O contêiner $name está rodando em modo privilegiado!"
    else
        echo "[OK] Contêiner $name sem privilégios elevados."
    fi
done

echo "[*] [CLOUD-AUDIT] Auditoria cloud-native finalizada."
