!/bin/bash
# Script de auditoria de segurança para contêineres Docker em execução
echo "[*] [CONTAINER-SECURITY] Iniciando auditoria de runtime e configurações Docker..."

echo "[+] Verificando contêineres rodando com privilégios elevados (--privileged):"
docker ps -q | xargs -I {} docker inspect --format '{{.Name}} - Privileged: {{.HostConfig.Privileged}}' {} 2>/dev/null

echo "[+] Verificando contêineres compartilhando o namespace de rede do host (--net=host):"
docker ps -q | xargs -I {} docker inspect --format '{{.Name}} - NetworkMode: {{.HostConfig.NetworkMode}}' {} 2>/dev/null

echo "[+] Verificando contêineres executando como root por padrão:"
docker ps -q | xargs -I {} docker inspect --format '{{.Name}} - User: {{.Config.User}}' {} 2>/dev/null

echo "[*] [CONTAINER-SECURITY] Auditoria de contêineres concluída com sucesso."
