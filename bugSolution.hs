{-# LANGUAGE FlexibleInstances #-}

module Main where

class Show a where
  showsPrec :: Int -> a -> ShowS

instance Show a => Show [a] where
  showsPrec p xs = showParen (p > 10) $ showList xs
    where
      showList []     = showString "[]"
      showList [x]    = showsPrec 11 x
      showList (x:xs) = showsPrec 11 x . showString "," . showList xs

data MyData = MyData { x :: Int }

instance Show MyData where
  showsPrec p (MyData x) = showString "MyData {" . showsPrec 11 x . showString "}"

main :: IO ()
main = do
  print [MyData {x = 1}, MyData {x = 2}]
-- The bug is that the parenthesis are not correctly placed depending on the precedence.
-- The solution below correctly places the parenthesis in the output
-- instance Show a => Show [a] where
--   showsPrec p xs = showParen (p > 10) $ showList xs
--     where
--       showList []     = showString "[]"
--       showList (x:xs) = showsPrec 11 x <> showString "," <> showList xs
--       showList [x]    = showsPrec 11 x