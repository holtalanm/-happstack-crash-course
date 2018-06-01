module Main where

import Control.Monad (msum)
import Data.Char (toLower)
import Happstack.Server (Method(GET, POST), FromReqURI(..), nullConf, simpleHTTP, ok, dir, path, method)

data Subject = World | Haskell

sayHello :: Subject -> String
sayHello World = "Hello, World!"
sayHello Haskell = "Greetings, Haskell!"

instance FromReqURI Subject where
    fromReqURI sub =
        case map toLower sub of
            "haskell" -> Just Haskell
            "world"   -> Just World
            _         -> Nothing

main :: IO ()
main = simpleHTTP nullConf $ msum [ dir "hello" $ path $ \subject -> ok $ (sayHello subject)
                                  , dir "methods" $ do method GET
                                                        ok $ "GET Method"
                                  , dir "methods" $ do method POST
                                                        ok $ "POST Method"
                                  ]
