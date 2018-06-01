module Main where

import Control.Monad
import Happstack.Server (nullConf, simpleHTTP, toResponse, ok, dir)

main :: IO ()
main = simpleHTTP nullConf $ msum [ mzero
                                  , ok "Hello, World!"
                                  , ok "Unreachable"
                                  ]
