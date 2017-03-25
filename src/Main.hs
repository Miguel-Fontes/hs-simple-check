module Main where

import qualified Examples.Basic as B

main :: IO ()
main = do
  putStrLn "hello world"
  B.tests

  return ()
