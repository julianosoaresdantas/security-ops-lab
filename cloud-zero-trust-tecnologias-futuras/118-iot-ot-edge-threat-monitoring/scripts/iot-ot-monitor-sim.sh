#!/bin/bash
# IoT and OT Edge Threat Monitoring Simulation Script
IOT_LOG="../logs/iot-ot-monitor.log"
mkdir -p ../logs

echo "[*] [IOT-OT-MONITOR] Initializing industrial control system packet inspector..."
echo "[+] Parsing Modbus register writes, abnormal sensor telemetry, and unauthorized PLC instructions..."
echo "$(date '+%F %T') - ICS_ANOMALY_ALERT - Unauthorized write command detected on critical edge actuator." >> "$IOT_LOG"
echo "[+] IoT/OT threat monitoring check complete. Log saved to $IOT_LOG"
