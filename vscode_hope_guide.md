# Guia Completo: Usando Hope no VSCode

## 🚀 Configuração Completa

Todas as configurações foram automaticamente criadas! Sua configuração inclui:

### ✅ O que foi configurado:

1. **Extensão personalizada Hope** (`~/.vscode/extensions/hope-language/`)
   - Syntax highlighting completo
   - Reconhecimento de arquivos `.hop`
   - Auto-indentação inteligente
   - Snippets de código

2. **Configurações do workspace** (`.vscode/` na pasta Hope)
   - Associação de arquivos `.hop` 
   - Configurações de editor otimizadas
   - Terminal integrado configurado

3. **Tasks automáticas**
   - Executar arquivo Hope atual
   - Abrir interpretador interativo
   - Verificar sintaxe

4. **Launch configurations**
   - Debug e execução integrados

## 🎯 Como Usar

### 1. **Abrir VSCode com Hope**

```bash
# Opção 1: Use o script criado
./open-vscode.sh

# Opção 2: Abrir arquivo específico
./open-vscode.sh meuarquivo.hop

# Opção 3: Comando direto
code .
```

### 2. **Executar programas Hope**

**Método 1 - Command Palette (Recomendado):**
- Pressione `Ctrl+Shift+P`
- Digite "Run Hope File"
- Pressione Enter

**Método 2 - Tecla de atalho:**
- Pressione `Ctrl+Shift+B` (Build task)

**Método 3 - Terminal integrado:**
- Pressione `Ctrl+` (abre terminal)
- Digite: `hope -f nome_arquivo.hop`

**Método 4 - Debug:**
- Pressione `F5`
- Selecione "Run Current Hope File"

### 3. **Usando Snippets**

Digite estas palavras-chave e pressione `Tab`:

| Snippet | Código gerado |
|---------|---------------|
| `dec` | Declaração de função completa |
| `data` | Definição de tipo de dados |
| `listfun` | Função para processar listas |
| `if` | Expressão condicional |
| `lambda` | Expressão lambda |
| `match` | Pattern matching |
| `header` | Cabeçalho de arquivo |

**Exemplo:**
1. Digite `dec` e pressione Tab
2. Preencha os campos: nome, tipos, definição
3. Use Tab para navegar entre os campos

### 4. **Features do Editor**

**Syntax Highlighting:**
- ✅ Palavras-chave (`dec`, `data`, `if`, `lambda`, etc.)
- ✅ Operadores (`<=`, `->`, `::`, `<>`, etc.)
- ✅ Tipos (`num`, `char`, `bool`, `list`)
- ✅ Comentários (`!` e `!!`)
- ✅ Strings e números
- ✅ Funções built-in

**Auto-indentação:**
- ✅ Indenta automaticamente após `dec`, `data`, `---`
- ✅ Alinha pattern matching
- ✅ Indenta blocos where

**Auto-complete:**
- ✅ Parênteses, colchetes, aspas
- ✅ Comentários em bloco

## 🔧 Personalização

### 1. **Modificar cores (opcional)**

Edite `.vscode/settings.json`:

```json
{
  "workbench.colorCustomizations": {
    "editor.background": "#0d1117",
    "editorGroupHeader.tabsBackground": "#161b22"
  }
}
```

### 2. **Adicionar mais snippets**

Edite `~/.vscode/extensions/hope-language/snippets/hope.json`

### 3. **Configurar atalhos personalizados**

Vá em: File → Preferences → Keyboard Shortcuts

Procure por "Run Hope File" e defina seu atalho.

## 📋 Comandos Úteis

### No Command Palette (`Ctrl+Shift+P`):

- `Run Hope File` - Executar arquivo atual
- `Run Hope Interactive` - Abrir interpretador
- `Check Hope Syntax` - Verificar sintaxe
- `Reload Window` - Recarregar VSCode

### Atalhos de Teclado:

| Atalho | Ação |
|--------|------|
| `Ctrl+Shift+B` | Executar Hope file |
| `Ctrl+`` | Terminal integrado |
| `F5` | Debug/Run |
| `Ctrl+Shift+P` | Command Palette |
| `Ctrl+Space` | Auto-complete |
| `Ctrl+/` | Comentário de linha |

## 🧪 Testando a Configuração

1. **Abra o arquivo de teste:**
   ```bash
   code teste_vscode.hop
   ```

2. **Verifique o syntax highlighting:**
   - Palavras-chave em azul
   - Comentários em verde
   - Strings em vermelho
   - Números destacados

3. **Teste os snippets:**
   - Digite `dec` + Tab
   - Complete a função
   - Digite `data` + Tab

4. **Execute o arquivo:**
   - `Ctrl+Shift+P` → "Run Hope File"
   - Veja a saída no terminal

## 🔍 Debugging e Troubleshooting

### Problemas Comuns:

**1. Syntax highlighting não funciona:**
- Verifique se o arquivo tem extensão `.hop`
- Recarregue o VSCode (`Ctrl+Shift+P` → "Reload Window")

**2. Task "Run Hope File" não aparece:**
- Verifique se está no workspace correto
- Reabra a pasta no VSCode

**3. Hope não encontrado:**
```bash
# Verifique se Hope está instalado
which hope

# Se necessário, adicione ao PATH
export PATH="/usr/local/bin:$PATH"
```

**4. Extensão não carrega:**
```bash
# Reinstale a extensão
rm -rf ~/.vscode/extensions/hope-language
# Execute novamente as configurações
```

### Verificação da Instalação:

```bash
# 1. Verifique arquivos de configuração
ls ~/.vscode/extensions/hope-language/
ls .vscode/

# 2. Teste Hope
hope -f exemplo_basico.hop

# 3. Teste VSCode
code teste_vscode.hop
```

## 🎨 Temas Recomendados

Para melhor experiência visual com Hope:

1. **Dark+ (padrão)** - Já configurado
2. **One Dark Pro** - Extensão externa
3. **Dracula Official** - Extensão externa
4. **Material Theme** - Extensão externa

## 📚 Próximos Passos

1. **Abra o VSCode:**
   ```bash
   ./open-vscode.sh
   ```

2. **Experimente os exemplos:**
   - `exemplo_basico.hop`
   - `exercicios.hop` 
   - `teste_vscode.hop`

3. **Pratique com snippets:**
   - Crie um novo arquivo `.hop`
   - Use os snippets para acelerar o desenvolvimento

4. **Explore as funcionalidades:**
   - Terminal integrado
   - Debug mode
   - Tasks automáticas

## 💡 Dicas Avançadas

1. **Multi-cursor:** `Ctrl+D` para seleção múltipla
2. **Find/Replace:** `Ctrl+H` com regex support
3. **Go to Definition:** `F12` (se implementado)
4. **Fold Code:** `Ctrl+Shift+[` e `Ctrl+Shift+]`
5. **Zen Mode:** `Ctrl+K Z` para foco total

---

**🎉 Pronto! Agora você tem um ambiente completo para desenvolver em Hope no VSCode!**
