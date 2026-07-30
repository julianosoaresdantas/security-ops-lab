#!/bin/bash
# Script analítico para monitorar conexões suspeitas e potenciais padrões de beaconing C2
echo "[*] [C2-HUNTER] Analisando conexões ativas em busca de padrões anômalos..."
ss -tunp | awk 'NR>1 {print $5, $6}' | sort | uniq -c | sort -nr
echo "[*] [C2-HUNTER] Análise de conexões concluída."
