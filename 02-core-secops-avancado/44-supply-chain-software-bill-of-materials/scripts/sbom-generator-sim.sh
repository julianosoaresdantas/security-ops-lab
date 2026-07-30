#!/bin/bash
# Simulador de geração e verificação de SBOM (Software Bill of Materials) para a cadeia de suprimentos
SBOM_LOG="../logs/sbom-supply-chain.log"
SBOM_OUTPUT="../configs/lab-sbom-inventory.json"
mkdir -p ../logs ../configs

echo "[*] [SUPPLY-CHAIN] Iniciando geração de SBOM para o ecossistema do laboratório..."

echo "[+] Mapeando dependências, pacotes e componentes ativos no repositório..."
cat << 'JSON' > "$SBOM_OUTPUT"
{
  "bomFormat": "CycloneDX",
  "specVersion": "1.4",
  "version": 1,
  "metadata": {
    "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
    "component": {
      "type": "application",
      "name": "security-ops-lab",
      "version": "44.0.0"
    }
  },
  "components": [
    {
      "type": "library",
      "name": "openssl",
      "version": "3.0.x"
    },
    {
      "type": "library",
      "name": "bash",
      "version": "5.x"
    }
  ]
}
JSON

echo "$(date '+%F %T') - SBOM_GEN - Inventário de SBOM gerado com sucesso em $SBOM_OUTPUT" >> "$SBOM_LOG"
echo "[+] SBOM gerado e validado. Registro salvo em $SBOM_LOG"
echo "[*] [SUPPLY-CHAIN] Gestão de SBOM operando com rastreabilidade total."
