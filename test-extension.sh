#!/bin/bash

echo "🔍 Diagnóstico da Extensão Hope para VSCode"
echo "=========================================="
echo ""

# 1. Verificar se a extensão existe
echo "1. 📁 Verificando arquivos da extensão..."
if [ -d ~/.vscode/extensions/hope-language ]; then
    echo "   ✅ Diretório da extensão encontrado"
    
    # Lista arquivos importantes
    echo "   📋 Arquivos principais:"
    for file in "package.json" "language-configuration.json" "syntaxes/hope.tmLanguage.json" "snippets/hope.json"; do
        if [ -f ~/.vscode/extensions/hope-language/$file ]; then
            echo "      ✅ $file"
        else
            echo "      ❌ $file (AUSENTE)"
        fi
    done
else
    echo "   ❌ Diretório da extensão não encontrado!"
    exit 1
fi

echo ""

# 2. Verificar se os arquivos estão bem formados
echo "2. 🔧 Verificando sintaxe dos arquivos JSON..."

# Verificar package.json
if command -v jq >/dev/null 2>&1; then
    if jq empty ~/.vscode/extensions/hope-language/package.json >/dev/null 2>&1; then
        echo "   ✅ package.json - sintaxe válida"
    else
        echo "   ❌ package.json - sintaxe inválida"
    fi
    
    if jq empty ~/.vscode/extensions/hope-language/syntaxes/hope.tmLanguage.json >/dev/null 2>&1; then
        echo "   ✅ hope.tmLanguage.json - sintaxe válida"
    else
        echo "   ❌ hope.tmLanguage.json - sintaxe inválida"
    fi
else
    echo "   ⚠️  jq não instalado - não foi possível verificar sintaxe JSON"
fi

echo ""

# 3. Verificar arquivo de teste
echo "3. 📄 Verificando arquivo de teste..."
if [ -f /home/nicolas/hope/teste_vscode.hop ]; then
    echo "   ✅ teste_vscode.hop encontrado"
    echo "   📊 Tamanho: $(stat -c%s /home/nicolas/hope/teste_vscode.hop) bytes"
    echo "   📝 Primeiras linhas:"
    head -3 /home/nicolas/hope/teste_vscode.hop | sed 's/^/      /'
else
    echo "   ❌ teste_vscode.hop não encontrado"
fi

echo ""

# 4. Verificar configurações do workspace
echo "4. ⚙️  Verificando configurações do workspace..."
if [ -f /home/nicolas/hope/.vscode/settings.json ]; then
    echo "   ✅ settings.json encontrado"
    if grep -q "\"*.hop\": \"hope\"" /home/nicolas/hope/.vscode/settings.json; then
        echo "   ✅ Associação .hop -> hope configurada"
    else
        echo "   ⚠️  Associação .hop -> hope não encontrada"
    fi
else
    echo "   ❌ settings.json não encontrado"
fi

echo ""

# 5. Mostrar informações da grammar
echo "5. 📝 Informações da grammar:"
if [ -f ~/.vscode/extensions/hope-language/syntaxes/hope.tmLanguage.json ]; then
    echo "   📋 Scopename: $(grep '"scopeName"' ~/.vscode/extensions/hope-language/syntaxes/hope.tmLanguage.json | cut -d'"' -f4)"
    echo "   📋 Nome: $(grep '"name"' ~/.vscode/extensions/hope-language/syntaxes/hope.tmLanguage.json | head -1 | cut -d'"' -f4)"
    echo "   📋 Padrões definidos: $(grep -c '"include"' ~/.vscode/extensions/hope-language/syntaxes/hope.tmLanguage.json)"
fi

echo ""

# 6. Instruções para testar
echo "6. 🧪 Como testar a extensão:"
echo "   1. Execute: ./reload-extension.sh"
echo "   2. No VSCode, abra teste_vscode.hop"
echo "   3. Verifique no canto inferior direito se mostra 'Hope' como linguagem"
echo "   4. Se não mostrar, clique na linguagem e selecione 'Hope'"
echo "   5. Se ainda não funcionar:"
echo "      - Ctrl+Shift+P"
echo "      - Digite: 'Developer: Reload Window'"
echo "      - Pressione Enter"

echo ""

# 7. Comando para testar manualmente
echo "7. 🚀 Para testar agora:"
echo "   ./reload-extension.sh"

echo ""
echo "✅ Diagnóstico concluído!"
