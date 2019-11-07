# lp-trabalho-2
Trabalho 2 da cadeira de Linguagens de Programação, 2019/2.

A atividade consiste na codificação de funções na linguagem Haskell, 
utilizando o paradigma funcional, além dos conteúdos vistos em aula.

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
