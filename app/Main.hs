{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where
import Web.Spock
import Web.Spock.Config
import Data.Aeson        hiding (json)
import Data.Monoid       ((<>))
import Data.Text         (Text, pack)
import GHC.Generics

-- Here we are defining a datatype that
-- can be converted to JSON using aeson

data Person = Person
  { name :: Text
  , age  :: Int
  } deriving (Generic, Show)
instance ToJSON Person
instance FromJSON Person

-- Here we defien out routes

type Api = SpockM () () () ()
type ApiAction a = SpockAction () () () a
app :: Api 
app = do
    get root (text "<html><h1>Hello!</h1><a href='/other'>other</a></html>")
    get "/other" (text "<h1>Goodbye!</h1><a href='/'>root</a>")
    get "/json" (json $ Person { name = "Fry", age = 25 })

-- Here we serve teh aplication

main :: IO ()
main = do
    cfg <- defaultSpockCfg () PCNoDatabase ()
    runSpock 8080 (spock cfg app)
