#!/bin/bash
# Deception Technology and Honeytoken Mesh Simulation Script
DECEPTION_LOG="../logs/deception-mesh.log"
mkdir -p ../logs

echo "[*] [DECEPTION-MESH] Initializing canary credentials and decoy infrastructure..."
echo "[+] Monitoring honeytoken access logs, fake administrative shares, and bait database records..."
echo "$(date '+%F %T') - HONEYTOKEN_TRIGGERED - Unauthorized lateral probe detected against decoy SSH trap." >> "$DECEPTION_LOG"
echo "[+] Deception telemetry collection complete. Log saved to $DECEPTION_LOG"
