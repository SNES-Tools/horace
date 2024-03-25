module Main where

import Parser
import Lexer

main :: IO ()
main = getContents >>= print . parse . lexer
