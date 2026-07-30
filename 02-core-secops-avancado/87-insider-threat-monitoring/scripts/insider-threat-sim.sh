#!/bin/bash
# Simulador de monitoramento de ameaças internas e análise de comportamento UEBA
INSIDER_LOG="../logs/insider-threat.log"
mkdir -p ../logs

echo "[*] [INSIDER-THREAT] Inicializando motor de análise comportamental de usuários e entidades (UEBA)..."

echo "[+] Coletando logs de acesso a arquivos, padrões de digitação e horários atípicos de atividade corporativa..."
echo "[+] Correlacionando saltos de privilégio e tentativas de transferência em massa de dados confidenciais..."

# Simula detecção de ameaça interna
echo "$(date '+%F %T') - UEBA_ANOMALY_ALERT - Comportamento de usuário atípico detectado e isolado para auditoria de segurança interna." >> "$INSIDER_LOG"

echo "[+] Ciclo de monitoramento de ameaças internas concluído. Registro de auditoria salvo em $INSIDER_LOG"
echo "[*] [INSIDER-THREAT] Sistema de análise comportamental operando em modo de vigilância contínua."
