--Construa um programa que ordena em ordem ascendente uma lista de listas a partir do tamanho das sublistas. Por exemplo:

--mysort [[3,1,2],[2,1],[5,7,1,2],[11]]
--Output: [[11],[2,1],[3,1,2],[5,7,1,2]]

--Utilizando bubble sort e quick sort
--TODO: Refatorar bubbleSort

sortList :: [[a]] -> [[a]]
sortList [[]] = [[]]
sortList xss = bubbleSort xss

bubbleSort :: [[a]] -> [[a]]
bubbleSort [] = []
bubbleSort [x] = [x]
bubbleSort (x:y:arrLeft) = bubbleSort(init bubbled) ++ [last bubbled]
  where (smaller,bigger) = if(length x <= length y) then (x, y) else (y, x)
    bubbled = [smaller] ++ bubbleSort (bigger:arrLeft)
-- Defina a função myMap :: (a -> b) -> (a -> b) -> [a] -> [b] que aplica de forma alternada duas funções passadas como argumentos aos elementos de uma lista.
--myMap (+3) (*10) [0,1,2,3,4,11]

myMap :: (a -> b) -> (a -> b) -> [a] -> [b]
myMap _ _ [] = []
myMap f1 f2 (x1:x2:xs) = f1 x1 : f2 x2 : myMap f1 f2 xs

-- A partir da função myMap, defina um função luhn :: [Int] -> Bool que implemente o algoritmo de Luhn para a validações de números de cartão de crédito para códigos de cartão de qualquer tamanho.

luhn :: [Int] -> Bool
luhn [] = False
luhn xs = ((sum (myMap luhnDouble (+0) xs)) `mod` 10) == 0

luhnDouble :: Int -> Int
luhnDouble x 
  | (x * 2) > 9 = (x * 2) - 9 
  | otherwise = x * 2