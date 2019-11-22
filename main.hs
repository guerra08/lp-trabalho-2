--Linguagens de Programação: T2 2019/2
--Autores: Bruno Gava Guerra e Eduardo Nohr Lessa

--Problemas:

-- 1: Construa um programa que ordena em ordem ascendente uma lista de listas a partir do tamanho das sublistas. Por exemplo:

-- mySort [[3,1,2],[2,1],[5,7,1,2],[11]]
-- Output: [[11],[2,1],[3,1,2],[5,7,1,2]]

-- Foi desenvolvido utilizando o bubbleSort como método de ordenação.

mysort :: [[a]] -> [[a]]
mysort [[]] = [[]]
mysort xss = bubbleSort xss

bubbleSort :: [[a]] -> [[a]]
bubbleSort [] = []
bubbleSort [x] = [x]
bubbleSort xss = bubbleAux xss (length xss)

bubbleAux :: [[a]] -> Int -> [[a]]
bubbleAux [] _ = []
bubbleAux [x] _ = [x]
bubbleAux xss 0 = xss
bubbleAux xss n = bubbleAux (swap xss) (n-1)

swap :: [[a]] -> [[a]]
swap [x] = [x]
swap (xs:ys:xss)
  | (length xs) > (length ys) = ys : swap (xs:xss)
  | otherwise = xs : swap (ys:xss)

-- 2: Defina a função myMap :: (a -> b) -> (a -> b) -> [a] -> [b] que aplica de forma alternada duas funções passadas como argumentos aos elementos de uma lista.

--myMap (+3) (*10) [0,1,2,3,4,11]

myMap :: (a -> b) -> (a -> b) -> [a] -> [b]
myMap _ _ [] = []
myMap f1 f2 (x1:x2:xs) = f1 x1 : f2 x2 : myMap f1 f2 xs
myMap f1 f2 (x1:xs) = f1 x1 : []

-- 3: A partir da função myMap, defina um função luhn :: [Int] -> Bool que implemente o algoritmo de Luhn para a validações de números de cartão de crédito para códigos de cartão de qualquer tamanho.

-- Como entrada, é passada uma lista contendo cada dígito do número do cartão.
--Ex: [5,2,3,4,5,6,7,8, ...]

--Também foi criada uma versão que recebe uma string com os dígitos do cartão.
--Ex: "1784"

luhn :: [Int] -> Bool
luhn [] = False
luhn xs = (z /= 0) && (z `mod` 10 == 0)
  where z = sum (myMap luhnDouble (+0) xs)

luhnStr :: [Char] -> Bool
luhnStr [] = False
luhnStr xs = (z /= 0) && (z `mod` 10 == 0)
  where z = (sum (myMap luhnDouble (+0) (convertToListOfInt xs (length xs))))

luhnDouble :: Int -> Int
luhnDouble x 
  | (x * 2) > 9 = (x * 2) - 9 
  | otherwise = x * 2

-- 4:  Construa um programa em Haskell capaz de converter um número octal (na forma forma de string) em um número decimal. Trate uma entrada inválida com 0 octal. Não use funções prontas de conversão, construa a sua própria versão usando suas próprias funções ou as funções disponíveis no prelude.hs.

octalToDecimal :: [Char] -> Int
octalToDecimal [] = 0
octalToDecimal xs 
  | checkIfValidOct (convertToListOfIntOct xs (length xs)) = convertAndSum (convertToListOfIntOct xs (length xs)) (length xs - 1)
  | otherwise = 0

convertAndSum :: [Int] -> Int -> Int
convertAndSum [] _ = 0
convertAndSum (x : xs) n = (convertOctToDec x n) + (convertAndSum xs (n-1))

checkIfValidOct :: [Int] -> Bool
checkIfValidOct [] = True
checkIfValidOct (x : xs) 
  | x == (-1) = False
  | otherwise = checkIfValidOct xs
  
--Recebe uma string ([Char]) e converte em uma lista de Int (uso geral)
convertToListOfInt :: [Char] -> Int -> [Int]
convertToListOfInt [] _ = []
convertToListOfInt (x:xs) pos 
  | (charToInt x) /= -1 = charToInt x : convertToListOfInt xs (pos-1)
  | otherwise = [0]

convertOctToDec :: Int -> Int -> Int
convertOctToDec num pos = num * (8^pos)

--Recebe uma string ([Char]) e converte em uma lista de Int (para questão 4)
convertToListOfIntOct :: [Char] -> Int -> [Int]
convertToListOfIntOct [] _ = []
convertToListOfIntOct (x:xs) pos = charToIntOct x : convertToListOfIntOct xs (pos-1)

--Recebe um Char e converte em Int (uso geral)
charToInt :: Char -> Int
charToInt x | x >= '0' && x <= '9' 
              = fromEnum x - fromEnum '0'
            | otherwise = 0

--Recebe um Char e converte em Int (para questão 4)
charToIntOct :: Char -> Int
charToIntOct x | x >= '0' && x <= '7' 
              = fromEnum x - fromEnum '0'
            | otherwise = -1