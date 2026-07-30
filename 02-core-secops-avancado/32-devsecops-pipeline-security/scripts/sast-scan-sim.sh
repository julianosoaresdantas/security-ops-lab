#!/bin/bash
# Simulador de varredura SAST (Static Application Security Testing) para o pipeline DevSecOps
SCAN_LOG="../logs/sast-scan.log"
mkdir -p ../logs

echo "[*] [DEVSECOPS] Iniciando varredura SAST em artefatos de código..."

echo "[+] Verificando uso de funções inseguras ou credenciais hardcoded no repositório..."
find . -type f \( -name "*.sh" -o -name "*.py" -o -name "*.js" \) -exec grep -HnE "password\s*=|api_key\s*=|eval\(" {} \; > "$SCAN_LOG" 2>/dev/null

if [ -s "$SCAN_LOG" ]; then
    echo "[!] ALERTA: Possíveis vulnerabilidades ou segredos estáticos encontrados! Verifique: $SCAN_LOG"
else
    echo "[OK] Nenhuma falha crítica detectada pela varredura estática preliminar."
fi

echo "[*] [DEVSECOPS] Varredura SAST concluída com sucesso."
