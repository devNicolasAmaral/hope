#!/bin/bash

echo "🔧 Instalando extensão Hope de forma mais compatível com VSCode..."
echo ""

# Parar o VSCode se estiver rodando
echo "⏹️  Parando VSCode..."
pkill -f "code" 2>/dev/null || true
sleep 1

# Remover extensão existente se houver
echo "🗑️  Removendo extensão anterior..."
rm -rf ~/.vscode/extensions/hope-language 2>/dev/null || true

# Recriar a extensão com estrutura mais simples
echo "📦 Criando nova extensão..."
mkdir -p ~/.vscode/extensions/hope-language/syntaxes

# Package.json mais simples
cat > ~/.vscode/extensions/hope-language/package.json << 'EOF'
{
  "name": "hope-language",
  "displayName": "Hope Language",
  "description": "Hope functional programming language support",
  "version": "1.0.0",
  "publisher": "local",
  "engines": {
    "vscode": "^1.60.0"
  },
  "categories": ["Programming Languages"],
  "contributes": {
    "languages": [{
      "id": "hope",
      "aliases": ["Hope", "hope"],
      "extensions": [".hop"],
      "configuration": "./language-configuration.json"
    }],
    "grammars": [{
      "language": "hope",
      "scopeName": "source.hope",
      "path": "./syntaxes/hope.tmLanguage.json"
    }]
  }
}
EOF

# Language configuration mais simples
cat > ~/.vscode/extensions/hope-language/language-configuration.json << 'EOF'
{
  "comments": {
    "lineComment": "!"
  },
  "brackets": [
    ["[", "]"],
    ["(", ")"]
  ],
  "autoClosingPairs": [
    ["[", "]"],
    ["(", ")"],
    ["\"", "\""],
    ["'", "'"]
  ],
  "surroundingPairs": [
    ["[", "]"],
    ["(", ")"],
    ["\"", "\""],
    ["'", "'"]
  ]
}
EOF

# Grammar mais simples e testada
cat > ~/.vscode/extensions/hope-language/syntaxes/hope.tmLanguage.json << 'EOF'
{
  "$schema": "https://raw.githubusercontent.com/martinring/tmlanguage/master/tmlanguage.json",
  "name": "Hope",
  "scopeName": "source.hope",
  "patterns": [
    {
      "name": "comment.line.hope",
      "match": "!!.*$"
    },
    {
      "name": "comment.line.hope", 
      "match": "!.*$"
    },
    {
      "name": "string.quoted.double.hope",
      "begin": "\"",
      "end": "\"",
      "patterns": [
        {
          "name": "constant.character.escape.hope",
          "match": "\\\\."
        }
      ]
    },
    {
      "name": "string.quoted.single.hope",
      "begin": "'",
      "end": "'"
    },
    {
      "name": "constant.numeric.hope",
      "match": "\\b\\d+(\\.\\d+)?\\b"
    },
    {
      "name": "keyword.control.hope",
      "match": "\\b(dec|data|type|typevar|if|then|else|where|lambda)\\b"
    },
    {
      "name": "keyword.operator.hope",
      "match": "(---|<=|==|\\+\\+|->|=>|::|<>)"
    },
    {
      "name": "constant.language.hope",
      "match": "\\b(true|false|nil|succ)\\b"
    },
    {
      "name": "support.type.hope",
      "match": "\\b(num|char|bool|list|alpha|beta|gamma)\\b"
    },
    {
      "name": "keyword.operator.hope",
      "match": "(=|/=|<|<=|>|>=|\\+|-|\\*|/|div|mod|and|or|not)"
    },
    {
      "name": "entity.name.function.hope",
      "match": "\\b[a-z][a-zA-Z0-9_']*(?=\\s*\\(|\\s*:)"
    },
    {
      "name": "entity.name.type.hope",
      "match": "\\b[A-Z][a-zA-Z0-9_]*\\b"
    }
  ]
}
EOF

echo "✅ Extensão criada!"

# Verificar se a extensão foi criada corretamente
if [ -f ~/.vscode/extensions/hope-language/package.json ]; then
    echo "✅ package.json criado"
else
    echo "❌ Erro ao criar package.json"
    exit 1
fi

if [ -f ~/.vscode/extensions/hope-language/syntaxes/hope.tmLanguage.json ]; then
    echo "✅ Grammar criada"
else
    echo "❌ Erro ao criar grammar"
    exit 1
fi

# Forçar o VSCode a recarregar extensões
echo "🔄 Limpando cache do VSCode..."
rm -rf ~/.vscode/logs 2>/dev/null || true
rm -rf ~/.vscode/CachedExtensions 2>/dev/null || true

echo ""
echo "🚀 Abrindo VSCode para testar..."
code /home/nicolas/hope/teste_vscode.hop &

sleep 3

echo ""
echo "✨ INSTRUÇÕES IMPORTANTES:"
echo "1. Quando o VSCode abrir, pressione Ctrl+Shift+P"
echo "2. Digite: 'Developer: Reload Window'"
echo "3. Pressione Enter"
echo "4. Abra o arquivo teste_vscode.hop novamente"
echo "5. Verifique no canto inferior direito se está 'Hope'"
echo "6. Se não estiver, clique na linguagem e selecione 'Hope'"
echo ""
echo "🎯 Se ainda não funcionar:"
echo "1. Feche completamente o VSCode"
echo "2. Execute: code /home/nicolas/hope/teste_vscode.hop"
echo "3. No VSCode: View > Command Palette > 'Developer: Reload Window'"
echo ""
echo "📋 O syntax highlighting deve mostrar:"
echo "   - Comentários (!) em verde"
echo "   - Palavras-chave (dec, data, if) em azul/roxo"
echo "   - Strings em vermelho/laranja"
echo "   - Números destacados"
echo "   - Operadores (::, <>, ->) coloridos"
echo ""
