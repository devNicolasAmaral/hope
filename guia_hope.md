# Guia Completo para Programar em Hope

## Introdução

Hope é uma linguagem de programação funcional com avaliação lazy (preguiçosa) desenvolvida nos anos 1970 por Ross Paterson. Ela influenciou o design de outras linguagens lazy como Miranda e Haskell.

## Instalação e Configuração

O Hope foi compilado e instalado com sucesso em seu sistema. Para usar:

```bash
hope                    # Inicia o interpretador interativo
hope -f arquivo.hop     # Executa um arquivo Hope
```

## Conceitos Fundamentais

### 1. Comentários

```hope
! Este é um comentário de linha
!! Este é um comentário de documentação
```

### 2. Tipos Básicos

- `num`: números inteiros (e reais em algumas implementações)
- `char`: caracteres
- `bool`: valores booleanos (`true` e `false`)
- `list alpha`: listas de elementos do tipo `alpha`

### 3. Declaração de Funções

A sintaxe para declarar funções segue o padrão:

```hope
dec nome_funcao: tipo_entrada -> tipo_saida;
--- nome_funcao(parametro) <= definição;
```

Exemplo:
```hope
dec dobrar: num -> num;
--- dobrar(x) <= x * 2;
```

### 4. Listas

Listas são estruturas fundamentais em Hope:

```hope
! Lista vazia
[]

! Lista com elementos
[1, 2, 3, 4]

! Construção de listas com cons operator (::)
1 :: [2, 3, 4]  ! resulta em [1, 2, 3, 4]

! Concatenação de listas
[1, 2] <> [3, 4]  ! resulta em [1, 2, 3, 4]
```

### 5. Pattern Matching

Hope usa pattern matching para definir funções:

```hope
! Função que calcula o tamanho de uma lista
dec tamanho: list alpha -> num;
--- tamanho([]) <= 0;                    ! caso base: lista vazia
--- tamanho(x::xs) <= 1 + tamanho(xs);   ! caso recursivo
```

### 6. Condicionais

```hope
dec maior: num # num -> num;
--- maior(x, y) <= if x > y then x else y;
```

### 7. Tipos Algébricos

Você pode definir seus próprios tipos:

```hope
! Definindo um tipo para árvores binárias
data arvore(alpha) == vazia ++ folha(alpha) ++ no(arvore(alpha) # alpha # arvore(alpha));

! Função para contar nós
dec contar_nos: arvore(alpha) -> num;
--- contar_nos(vazia) <= 0;
--- contar_nos(folha(x)) <= 1;
--- contar_nos(no(esq, x, dir)) <= 1 + contar_nos(esq) + contar_nos(dir);
```

## Exemplos Práticos

### Exemplo 1: Funções Matemáticas Básicas

```hope
! Função para elevar um número ao quadrado
dec quadrado: num -> num;
--- quadrado(x) <= x * x;

! Função para calcular fatorial
dec fatorial: num -> num;
--- fatorial(0) <= 1;
--- fatorial(succ(n)) <= succ(n) * fatorial(n);

! Teste
quadrado(5);  ! retorna 25
fatorial(5);  ! retorna 120
```

### Exemplo 2: Manipulação de Listas

```hope
! Função para inverter uma lista
dec inverter: list alpha -> list alpha;
--- inverter([]) <= [];
--- inverter(x::xs) <= inverter(xs) <> [x];

! Função para filtrar elementos pares
dec pares: list num -> list num;
--- pares([]) <= [];
--- pares(x::xs) <= if x mod 2 = 0 
                    then x :: pares(xs) 
                    else pares(xs);

! Teste
inverter([1,2,3,4]);  ! retorna [4,3,2,1]
pares([1,2,3,4,5,6]); ! retorna [2,4,6]
```

### Exemplo 3: Função de Higher-Order

```hope
! Aplicar uma função a todos elementos de uma lista
dec mapear: (alpha -> beta) -> list alpha -> list beta;
--- mapear(f, []) <= [];
--- mapear(f, x::xs) <= f(x) :: mapear(f, xs);

! Teste usando a função quadrado definida anteriormente
mapear(quadrado, [1,2,3,4]);  ! retorna [1,4,9,16]
```

### Exemplo 4: Processamento de Strings

```hope
! Função para contar caracteres em uma string
dec contar_chars: list char -> num;
--- contar_chars([]) <= 0;
--- contar_chars(c::cs) <= 1 + contar_chars(cs);

! Função para converter string para maiúscula (simplificada)
dec primeira_palavra: list char -> list char;
--- primeira_palavra([]) <= [];
--- primeira_palavra(' '::xs) <= [];
--- primeira_palavra(c::cs) <= c :: primeira_palavra(cs);
```

## Recursos Avançados

### 1. Expressões Lambda

```hope
! Definindo funções anônimas
lambda x => x * 2;

! Usando com mapear
mapear(lambda x => x + 1, [1,2,3]);  ! incrementa cada elemento
```

### 2. Composição de Funções

```hope
! Operador de composição (o)
dec incrementar: num -> num;
--- incrementar(x) <= x + 1;

dec dobrar: num -> num;
--- dobrar(x) <= x * 2;

! Compondo funções: primeiro dobra, depois incrementa
(incrementar o dobrar)(5);  ! retorna 11 (5*2 + 1)
```

### 3. Tipos Paramétricos

```hope
! Definindo tipo Maybe (similar ao Optional)
data maybe(alpha) == nada ++ apenas(alpha);

dec valor_ou_padrao: alpha -> maybe(alpha) -> alpha;
--- valor_ou_padrao(padrao, nada) <= padrao;
--- valor_ou_padrao(padrao, apenas(x)) <= x;
```

## Biblioteca Padrão

Hope vem com uma biblioteca padrão rica. Alguns módulos úteis:

- **Standard.hop**: Tipos e funções básicas
- **list.hop**: Funções para manipulação de listas
- **arith.hop**: Funções aritméticas avançadas

Para usar funções da biblioteca:
```hope
use "list";  ! carrega módulo de listas

length([1,2,3,4]);  ! usa função length do módulo list
```

## Dicas para Começar

1. **Comece com funções simples**: Pratique com funções matemáticas básicas
2. **Use o interpretador interativo**: Teste pequenos trechos de código
3. **Pratique pattern matching**: É fundamental em Hope
4. **Pense recursivamente**: A maioria das funções em Hope são recursivas
5. **Explore a avaliação lazy**: Hope só avalia expressões quando necessário

## Exemplo Completo: Sistema de Notas

```hope
! Definindo tipo para representar uma nota
data nota == A ++ B ++ C ++ D ++ F;

! Convertendo nota para número
dec nota_para_numero: nota -> num;
--- nota_para_numero(A) <= 4;
--- nota_para_numero(B) <= 3;
--- nota_para_numero(C) <= 2;
--- nota_para_numero(D) <= 1;
--- nota_para_numero(F) <= 0;

! Calculando média de notas
dec media_notas: list nota -> num;
--- media_notas(notas) <= soma_numeros / tamanho_lista
    where soma_numeros == soma_lista(mapear(nota_para_numero, notas))
          and tamanho_lista == length(notas);

! Teste
media_notas([A, B, A, C]);  ! calcula a média
```

## Para Estudar Mais

- Examine os arquivos em `/usr/local/share/hope/lib/` para ver exemplos da biblioteca padrão
- Execute `hope -f /home/nicolas/hope/test/hope_tut.in` para ver mais exemplos
- Leia a documentação em `doc/` (se disponível)

## Comandos Úteis

```bash
hope                                    # Interpretador interativo  
hope -f arquivo.hop                    # Executa arquivo
hope -f arquivo.hop > saida.txt        # Salva saída em arquivo
HOPEPATH=/caminho/custom hope -f file  # Define caminho customizado para bibliotecas
```

Este guia oferece uma base sólida para começar a programar em Hope. A linguagem é elegante e poderosa, especialmente para algoritmos que envolvem listas e recursão.
