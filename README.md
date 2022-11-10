# Haskell REST API

We simple added the things to the cabal file (Assuming [cabal](https://) is installed) and the thing ran! Takes a long time to download everything.

But if you want something like nodemon, where the code can run you will need [ghcid](https://github.com/ndmitchell/ghcid)

I will add instruction for that later.

Minimal working example

```
module Main where

import Web.Spock
import Web.Spock.Config


app :: SpockM () () () ()
app = return ()

main :: IO ()
main = do
    cfg <- defaultSpockCfg () PCNoDatabase ()
    runSpock 8080 (spock cfg app)

```

When ran with `cabal run HaskellAPI` you will get a 404 on https://localhost:8080, But don't worry! It's an error "Powered by spock"!

Here is the next logical step. Now we are serving the string `"Hello"` in the route '/'

```
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Spock
import Web.Spock.Config


type Server a = SpockM () () () a

app :: Server ()

app = get root (text "Hello!")

main :: IO ()
main = do
    cfg <- defaultSpockCfg () PCNoDatabase ()
    runSpock 8080 (spock cfg app)

```



We could add lucid and spock-lucid to render HTML if you are intesrested in that. I personaly would be more interested in rendering JSON and parsing JSON

Here is the tutorial for that in the oficial documentation https://www.spock.li/tutorials/rest-api