#!/bin/bash
# Script de consolidação do Dashboard Executivo do SOC
DASHBOARD_FILE="../reports/executive-dashboard-$(date +%F).md"

echo "# Executive SOC Dashboard - Security Operations Lab" > "$DASHBOARD_FILE"
echo "**Data de Emissão:** $(date)" >> "$DASHBOARD_FILE"
echo "**Responsável:** Juliano" >> "$DASHBOARD_FILE"
echo "" >> "$DASHBOARD_FILE"
echo "## Resumo Executivo" >> "$DASHBOARD_FILE"
echo "O Security Operations Lab atingiu o marco de **20 módulos implementados**, englobando engenharia defensiva, automação SOAR, simulação de Red Team, Zero Trust, segurança Cloud-Native e Threat Intelligence." >> "$DASHBOARD_FILE"
echo "" >> "$DASHBOARD_FILE"
echo "## Status dos Componentes Críticos" >> "$DASHBOARD_FILE"
echo "- **Firewall / iptables:** Operacional e integrado com regras dinâmicas e IOCs." >> "$DASHBOARD_FILE"
echo "- **Contêineres e Cloud:** Auditoria ativa de segurança para contêineres Docker." >> "$DASHBOARD_FILE"
echo "- **Simulação de Ameaças:** Testes de resiliência e validação defensiva ativos." >> "$DASHBOARD_FILE"
echo "- **Automação e SIEM:** Scripts de resposta e monitoramento integrados." >> "$DASHBOARD_FILE"
echo "" >> "$DASHBOARD_FILE"
echo "---" >> "$DASHBOARD_FILE"
echo "*Relatório executivo gerado e versionado automaticamente.*" >> "$DASHBOARD_FILE"

echo "[*] [EXECUTIVE-DASHBOARD] Painel executivo gerado em $DASHBOARD_FILE"
cat "$DASHBOARD_FILE"
