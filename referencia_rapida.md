# Hope - Referência Rápida

## Sintaxe Básica

### Comentários
```hope
! Comentário de linha
!! Comentário de documentação
```

### Declaração de Função
```hope
dec nome: tipo_entrada -> tipo_saida;
--- nome(parametros) <= definição;
```

### Tipos Básicos
- `num` - números
- `char` - caracteres  
- `bool` - booleanos (`true`, `false`)
- `list alpha` - listas
- `alpha # beta` - produto (tupla)
- `alpha -> beta` - função

## Operadores

### Aritméticos
- `+` - adição
- `-` - subtração
- `*` - multiplicação  
- `/` - divisão
- `div` - divisão inteira
- `mod` - resto da divisão

### Relacionais
- `=` - igual
- `/=` - diferente
- `<` - menor que
- `=<` - menor ou igual
- `>` - maior que
- `>=` - maior ou igual

### Lógicos
- `and` - e lógico
- `or` - ou lógico
- `not` - negação

### Listas
- `::` - cons (construção)
- `<>` - concatenação
- `[]` - lista vazia

### Funções
- `o` - composição
- `#` - produto (tupla)
- `->` - tipo função

## Estruturas de Controle

### Condicional
```hope
if condição then valor1 else valor2
```

### Pattern Matching
```hope
dec funcao: tipo -> tipo;
--- funcao([]) <= caso_lista_vazia;
--- funcao(x::xs) <= caso_lista_não_vazia;
--- funcao(valor_especifico) <= caso_específico;
--- funcao(_) <= caso_catch_all;
```

## Listas

### Criação
```hope
[]              ! lista vazia
[1, 2, 3]       ! lista com elementos
1 :: [2, 3]     ! construção com cons
```

### Operações Comuns
```hope
length(lista)           ! tamanho
reverse(lista)          ! inverter
map(função, lista)      ! aplicar função
filter(predicate, lista) ! filtrar
```

## Tipos de Dados Personalizados

### Definição
```hope
data nome == construtor1 ++ construtor2(tipo) ++ ...;
```

### Exemplo
```hope
data arvore == vazia ++ folha(num) ++ no(arvore # num # arvore);
```

## Funções de Alta Ordem

### Lambda
```hope
lambda x => expressão
lambda (x, y) => expressão
lambda x y => expressão  ! curried
```

### Composição
```hope
(f o g)(x)  ! equivale a f(g(x))
```

## Avaliação Lazy

Hope usa avaliação lazy - expressões só são avaliadas quando necessário:

```hope
! Lista infinita - só funciona com lazy evaluation
dec naturais: num -> list num;
--- naturais(n) <= n :: naturais(n+1);
```

## Módulos

### Usar módulo
```hope
use "nome_modulo";
```

### Módulos padrão
- `Standard` - carregado automaticamente
- `list` - funções de lista
- `arith` - aritmética avançada

## Exemplos de Padrões Comuns

### Recursão de Cauda
```hope
dec soma_acc: list num # num -> num;
--- soma_acc([], acc) <= acc;
--- soma_acc(x::xs, acc) <= soma_acc(xs, x + acc);

dec soma: list num -> num;
--- soma(xs) <= soma_acc(xs, 0);
```

### Fold (Redução)
```hope
dec foldr: beta # (alpha # beta -> beta) -> list alpha -> beta;
--- foldr(base, op, []) <= base;
--- foldr(base, op, x::xs) <= op(x, foldr(base, op, xs));
```

### Map (Transformação)
```hope
dec map: (alpha -> beta) -> list alpha -> list beta;
--- map(f, []) <= [];
--- map(f, x::xs) <= f(x) :: map(f, xs);
```

## Dicas de Depuração

### Executar arquivo
```bash
hope -f arquivo.hop
```

### Interpretador interativo
```bash
hope
```

### Ver tipo de expressão
No interpretador, digite uma expressão e veja o tipo inferido.

### Erros comuns
- Esquecer `<=` na definição de função
- Usar `<=` em vez de `==` em comparações  
- Não cobrir todos os casos no pattern matching
- Problemas de precedência de operadores

## Precedência de Operadores (maior para menor)

1. Aplicação de função
2. `*`, `/`, `div`, `mod`
3. `+`, `-`
4. `::`, `<>`
5. `<`, `=<`, `>`, `>=`
6. `=`, `/=`
7. `and`
8. `or`
9. `->`
10. `#`

## Comandos do Sistema

```bash
hope                    # Interpretador interativo
hope -f file.hop        # Executar arquivo
HOPEPATH=dir hope       # Definir caminho de bibliotecas
man hope                # Manual do sistema
```
