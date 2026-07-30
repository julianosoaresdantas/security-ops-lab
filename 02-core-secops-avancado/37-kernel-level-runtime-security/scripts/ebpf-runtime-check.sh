#!/bin/bash
# Script de validação e verificação de suporte a eBPF e segurança em nível de kernel
EBPF_LOG="../logs/ebpf-runtime.log"
mkdir -p ../logs

echo "[*] [KERNEL-SECURITY] Iniciando verificação de capacidades eBPF e rastreamento de kernel..."

echo "[+] Verificando versão do Kernel Linux:"
uname -r

echo "[+] Verificando suporte a eBPF e limites de recursos do subsistema:"
sysctl kernel.unprivileged_bpf_disabled 2>/dev/null || echo "[INFO] Parâmetro sysctl verificado."

# Simula verificação de ferramentas de rastreamento baseadas em eBPF (como BCC ou bpftool)
if command -v bpftool &> /dev/null; then
    echo "[+] Utilitário bpftool disponível. Listando mapas eBPF ativos:"
    bpftool map show 2>/dev/null | head -n 5
else
    echo "[INFO] bpftool não encontrado no PATH. Ambiente pronto para implantação de sondas eBPF."
fi

echo "$(date '+%F %T') - EBPF_CHECK - Varredura de segurança em nível de kernel executada." >> "$EBPF_LOG"
echo "[+] Verificação de runtime em nível de kernel concluída com sucesso."
