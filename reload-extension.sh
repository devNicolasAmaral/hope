#!/bin/bash

echo "🔄 Recarregando extensão Hope no VSCode..."

# Mata qualquer processo do VSCode rodando
echo "⏹️  Fechando VSCode..."
pkill -f "code" 2>/dev/null || true

# Espera um pouco
sleep 2

# Força reload das extensões removendo cache se existir
if [ -d ~/.vscode/extensions/hope-language ]; then
    echo "✅ Extensão Hope encontrada"
    echo "📁 Localização: ~/.vscode/extensions/hope-language"
    
    # Lista arquivos da extensão
    echo "📋 Arquivos da extensão:"
    find ~/.vscode/extensions/hope-language -type f -name "*.json" | while read file; do
        echo "   - $(basename $file)"
    done
else
    echo "❌ Extensão Hope não encontrada!"
    exit 1
fi

echo ""
echo "🚀 Abrindo VSCode com extensão recarregada..."

# Abre VSCode no arquivo de teste
code /home/nicolas/hope/teste_vscode.hop

echo ""
echo "✨ Para forçar reload da extensão no VSCode:"
echo "   1. Abra Command Palette (Ctrl+Shift+P)"
echo "   2. Digite: 'Developer: Reload Window'"
echo "   3. Pressione Enter"
echo ""
echo "🎯 Para verificar se a extensão está ativa:"
echo "   1. Abra Command Palette (Ctrl+Shift+P)" 
echo "   2. Digite: 'Extensions: Show Built-in Extensions'"
echo "   3. Procure por 'Hope' na lista"
echo ""
echo "🔍 Se o highlighting ainda não funcionar:"
echo "   1. Verifique se o arquivo tem extensão .hop"
echo "   2. No canto inferior direito do VSCode, clique na linguagem"
echo "   3. Selecione 'Hope' na lista"
echo ""
