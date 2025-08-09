#!/bin/bash

# Script para abrir VSCode com Hope configurado
# Uso: ./open-vscode.sh [arquivo.hop]

echo "🌟 Abrindo VSCode com suporte completo para Hope..."

# Verifica se a extensão está instalada
if [ ! -d ~/.vscode/extensions/hope-language ]; then
    echo "❌ Extensão Hope não encontrada. Instalando..."
    exit 1
fi

# Se um arquivo foi especificado, abre ele
if [ "$1" ]; then
    if [ -f "$1" ]; then
        echo "📂 Abrindo arquivo: $1"
        code "$1"
    else
        echo "📄 Criando novo arquivo: $1"
        touch "$1"
        code "$1"
    fi
else
    # Abre o diretório atual
    echo "📂 Abrindo workspace Hope no VSCode..."
    code .
fi

echo ""
echo "🚀 VSCode aberto com as seguintes funcionalidades:"
echo "   ✅ Syntax highlighting para .hop files"
echo "   ✅ Snippets (digite 'dec', 'data', 'listfun', etc.)"
echo "   ✅ Tasks: Ctrl+Shift+P > 'Run Hope File'"
echo "   ✅ Terminal integrado com Hope"
echo "   ✅ Auto-complete e auto-indent"
echo ""
echo "💡 Dicas:"
echo "   - Use Ctrl+Shift+P > 'Run Hope File' para executar"
echo "   - Use Ctrl+\` para abrir terminal integrado"
echo "   - Digite 'dec' e Tab para snippet de função"
echo "   - Use F5 para executar com debug"
echo ""
