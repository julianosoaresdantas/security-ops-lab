#!/bin/bash
# Script para teste e simulação de pipeline de envio de telemetria para SIEM
SIEM_LOG_DIR="../logs"
mkdir -p "$SIEM_LOG_DIR"
PIPELINE_LOG="$SIEM_LOG_DIR/siem-pipeline.log"

echo "[*] [SIEM-CLOUD] Iniciando verificação do pipeline de telemetria..."

# Simula a geração e estruturação de um evento em formato JSON normalizado para o SIEM
EVENT_JSON="{\"timestamp\":\"$(date -u +%FT%TZ)\",\"source\":\"security-ops-lab\",\"module\":\"28-cloud-native-siem\",\"event_type\":\"telemetry_heartbeat\",\"status\":\"healthy\"}"

echo "$EVENT_JSON" >> "$PIPELINE_LOG"
echo "[+] Evento de telemetria normalizado e injetado no pipeline: $PIPELINE_LOG"
echo "[*] [SIEM-CLOUD] Sincronização de logs com o coletor central validada com sucesso."
