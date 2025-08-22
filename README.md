# Exercícios de Linguagem de Programação Funcional com Hope

![Hope Language](https://img.shields.io/badge/Language-Hope-blue.svg)
![Status](https://img.shields.io/badge/status-em%20andamento-yellow.svg)

## Sobre o Repositório

Bem-vindo ao meu repositório de estudos em **Hope**! Este espaço é dedicado ao registro e à documentação dos exercícios práticos desenvolvidos durante as aulas de Programação Funcional. O objetivo é aplicar os conceitos teóricos da linguagem Hope, uma das pioneiras no paradigma funcional, e construir um portfólio de exemplos e soluções.

## O que é a Linguagem Hope?

Hope é uma linguagem de programação funcional desenvolvida na Universidade de Edimburgo nos anos 70. Ela é notável por ser uma das primeiras linguagens a apresentar casamento de padrões (*pattern matching*) e tipos de dados algébricos, características que influenciaram muitas linguagens funcionais modernas, como Haskell e Miranda.

## 📂 Estrutura do Repositório

Os exercícios estão organizados em pastas, seguindo a ordem das aulas ou temas abordados. Cada pasta pode conter um ou mais arquivos `.hope` com os desafios propostos.

## 🚀 Como Executar os Exercícios

Para executar os códigos deste repositório, você precisará de um interpretador da linguagem Hope. O método de execução pode variar dependendo do ambiente e do interpretador utilizado em aula.

**Exemplo genérico de como carregar e executar um arquivo:**

1.  **Abra o interpretador Hope** no seu terminal.
2.  **Carregue o arquivo** desejado com o comando apropriado (pode ser `/load` ou similar):
    ```bash
    /load "01-Conceitos_Basicos/exercicio1.hope"
    ```
3.  **Chame as funções** definidas no arquivo para ver o resultado:
    ```hope
    minha_funcao(parametro1, parametro2);
    ```

**Observação:** Caso utilize um interpretador ou compilador específico, sinta-se à vontade para adicionar as instruções detalhadas aqui.

## Exemplos de Código

Aqui está um exemplo clássico de Fatorial em Hope, para ilustrar a sintaxe da linguagem:

```hope
dec fact : num -> num;
--- fact 0 <= 1;
--- fact n <= n * fact(n-1);

Para testar, após carregar o arquivo, você pode executar:

Snippet de código

fact(5);
👨‍💻 Contato
Este é um projeto de aprendizado pessoal. Caso tenha alguma dúvida ou sugestão, sinta-se à vontade para me contatar.

Nicolas Amaral

GitHub: devNicolasAmaral

LinkedIn: SEU_LINK_DO_LINKEDIN_AQUI
