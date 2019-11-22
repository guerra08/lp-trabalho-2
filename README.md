# lp-trabalho-2
<b>Trabalho 2 da cadeira de Linguagens de Programação, 2019/2.</b>

<b>Autores: Bruno Gava Guerra e Eduardo Nohr Lessa</b>

A atividade consiste na resolução de problemas utilizando a linguagem Haskell e 
o paradigma funcional. Para isso, fez-se necessário aplicar os conteúdos vistos em aula, disponibilizados no ambiente Moodle da disciplina. Também, foram consultados materiais encontrados na internet.

Enunciados das questões:

1. Construa um programa que ordena em ordem ascendente uma lista de listas a partir do tamanho das sublistas. Por exemplo:

> mysort [[3,1,2],[2,1],[5,7,1,2],[11]]
[[11],[2,1],[3,1,2],[5,7,1,2]]

Dica: examine o pacote Data.List.

2. Defina a função myMap :: (a -> b) -> (a -> b) -> [a] -> [b] que aplica de forma alternada 
duas funções passadas como argumentos aos elementos de uma lista. Por exemplo:

> myMap (+3) (*10) [0,1,2,3,4,11]
[3,10,5,30,7,110]

3. A partir da função myMap, defina um função luhn :: [Int] -> Bool que implemente 
o algoritmo de Luhn para a validações de números de cartão de crédito 
para códigos de cartão de qualquer tamanho.

4. Construa um programa em Haskell capaz de converter um número octal (na forma forma de string) 
em um número decimal. Trate uma entrada inválida com 0 octal. 
Não use funções prontas de conversão, construa a sua própria versão 
usando suas próprias funções ou as funções disponíveis no prelude.hs.

----------------------------------------------------------------------------------------------------------------------------

<b>Funções desenvolvidas:</b>

mysort -> Ordena uma lista de listas de acordo com o tamanho das listas. 

Ex: mysort [[1,2],[1],[1,2,3]] = [[1],[1,2],[1,2,3]]
Utiliza um simples bubble sort para ordenação.

myMap -> Aplica duas funções a uma lista de maneira alternada.

Ex: myMap (+1) (+3) [1,2,3,4] = [2,5,4,7]

luhn -> Recebe uma lista de tamanho n com os digitos de um cartão de crédito e retorna se é válido utilizando o algoritmo de Luhn.

Ex: luhn [1,2,3,4] = False

octalToDecimal -> Recebe uma string representando um numero em base octal e retorna o mesmo em base decimal. Se for um número inválido, retorna 0.

Ex: octalToDecimal 12 = 10

----------------------------------------------------------------------------------------------------------------------------

Como consulta, utilizou-se os seguintes materiais:

Ordenação - Linguagem Haskell. Disponível em:
http://www.facom.ufu.br/~madriana/PF/Haskell11.pdf

Wiki Haskell. Disponível em:
https://wiki.haskell.org/Haskell

Foram feitas algumas funcionalidades extras. 

1. É possível utilizar o algoritmo de Luhn passando uma String como argumento. A função se chama luhnStr
2. Foram feitos diferentes métodos para converter uma String em uma lista de inteiros, tanto para a conversão de octal para decimal como para o algoritmo de Luhn com String.

Em revisões futuras, pretende-se implementar outros algoritmos de ordenação além do Bubble Sort.
