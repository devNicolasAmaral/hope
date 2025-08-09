# 🔧 Solucionando Problemas de Syntax Highlighting

## ❗ Problema: Código aparece com uma só cor

Se o código Hope no VSCode está aparecendo todo com a mesma cor (sem syntax highlighting), siga estes passos:

## ✅ **Solução 1: Instalação Limpa (RECOMENDADA)**

```bash
# Execute este script para reinstalar a extensão
./install-hope-extension.sh
```

Depois, no VSCode:
1. **Ctrl+Shift+P** (Command Palette)
2. Digite: **"Developer: Reload Window"**
3. Pressione **Enter**
4. Abra o arquivo `teste_vscode.hop`

## ✅ **Solução 2: Seleção Manual da Linguagem**

1. Abra o arquivo `teste_vscode.hop` no VSCode
2. Olhe no **canto inferior direito** da tela
3. Você verá algo como "Plain Text" ou outra linguagem
4. **Clique** nessa indicação de linguagem
5. Na lista que aparecer, selecione **"Hope"**
6. O syntax highlighting deve ativar imediatamente

## ✅ **Solução 3: Verificar Associação de Arquivo**

No VSCode:
1. **Ctrl+Shift+P** (Command Palette)
2. Digite: **"Preferences: Open Settings (JSON)"**
3. Adicione estas linhas no arquivo de configuração:

```json
{
  "files.associations": {
    "*.hop": "hope"
  }
}
```

4. Salve o arquivo (**Ctrl+S**)
5. **Ctrl+Shift+P** → "Developer: Reload Window"

## ✅ **Solução 4: Reinstalação Completa**

Se ainda não funcionar:

```bash
# 1. Remover extensão
rm -rf ~/.vscode/extensions/hope-language

# 2. Reinstalar
./install-hope-extension.sh

# 3. Limpar cache do VSCode
rm -rf ~/.vscode/logs
rm -rf ~/.config/Code/User/workspaceStorage/*

# 4. Abrir VSCode limpo
code /home/nicolas/hope/teste_vscode.hop
```

## 🧪 **Como Testar se Funciona**

Após aplicar qualquer solução, abra o arquivo `teste_vscode.hop` e verifique:

### ✅ **Deve aparecer colorido:**
- **Comentários** (`!` e `!!`) em **verde**
- **Palavras-chave** (`dec`, `data`, `if`, `lambda`) em **azul/roxo**
- **Strings** (`"texto"`, `'char'`) em **vermelho/laranja**
- **Números** (`123`, `45.6`) **destacados**
- **Operadores** (`<=`, `->`, `::`, `<>`) **coloridos**
- **Tipos** (`num`, `char`, `bool`, `list`) **destacados**

### ❌ **Se ainda estiver monocromático:**
- Todo o código com a mesma cor
- Sem distinção entre comentários, palavras-chave, etc.

## 🔍 **Diagnóstico Avançado**

Execute o diagnóstico para verificar se tudo está correto:

```bash
./test-extension.sh
```

### Verificar no VSCode:
1. **Ctrl+Shift+P**
2. Digite: **"Developer: Show Running Extensions"**
3. Procure por "Hope Language" na lista
4. Se não aparecer, a extensão não está carregada

## 🚨 **Soluções de Emergência**

### Se NADA funcionar:

#### **Opção A: Extensão Marketplace**
1. No VSCode: **Ctrl+Shift+X** (Extensions)
2. Busque por extensões similares: "functional", "haskell", "ml"
3. Instale uma extensão similar temporariamente

#### **Opção B: Configuração Manual**
1. Abra arquivo `.hop`
2. **Ctrl+Shift+P**
3. Digite: **"Change Language Mode"**
4. Selecione uma linguagem similar (ex: "Haskell", "F#")
5. Isso dará pelo menos algum highlighting básico

#### **Opção C: Reset Completo do VSCode**
```bash
# CUIDADO: Remove TODAS as configurações do VSCode
rm -rf ~/.vscode
rm -rf ~/.config/Code

# Reinstalar extensão
./install-hope-extension.sh
```

## 📋 **Checklist de Verificação**

Marque cada item conforme for verificando:

- [ ] Arquivo tem extensão `.hop`
- [ ] Extensão Hope está em `~/.vscode/extensions/hope-language/`
- [ ] Indicador de linguagem no VSCode mostra "Hope"
- [ ] Executou "Developer: Reload Window"
- [ ] Testou com o arquivo `teste_vscode.hop`

## 💡 **Dicas Extras**

### **Para desenvolver Hope:**
1. Use o tema **"Dark+"** ou **"One Dark Pro"** para melhor contraste
2. Configure a fonte **"JetBrains Mono"** ou **"Fira Code"**
3. Ative ligatures de fonte para operadores como `->` e `<=`

### **Atalhos úteis:**
- **Ctrl+/** - Comentar/descomentar linha
- **Ctrl+Shift+P** - Command Palette
- **F5** - Executar programa Hope
- **Ctrl+`** - Terminal integrado

## 🆘 **Se Ainda Não Funcionar**

1. **Reinicie o computador** (às vezes o VSCode fica com cache persistente)
2. **Verifique se tem permissões** para escrever em `~/.vscode/`
3. **Teste com outro usuário** para verificar se é problema de configuração
4. **Use o VSCode Insiders** como alternativa

---

## 🎯 **Resultado Esperado**

Depois de seguir estes passos, seu VSCode deve mostrar o código Hope com syntax highlighting completo, similar a outras linguagens funcionais como Haskell ou F#.

**Se conseguir ver as cores, parabéns! 🎉 Sua configuração está funcionando!**
