{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}

module Main where
import Web.Spock
import Web.Spock.Config
import Data.Aeson        hiding (json)
import Data.Monoid       ((<>))
import Data.Text         (Text, pack)
import GHC.Generics
import Web.Spock.Lucid (lucid)
import Lucid


-- Views
import Views.Hello
import Views.Goodbye

--  Model

data Person = Person
  { name :: Text
  , age  :: Int
  } deriving (Generic, Show)
instance ToJSON Person
instance FromJSON Person


-- Controler/Router

type Api = SpockM () () () ()
type ApiAction a = SpockAction () () () a
app :: Api 
app = do

    get (root) $ 
        lucid hello_
    
    get ("other") $ 
        lucid goodbye_
    
    get ("api/person" <//> var)  $ 
        \name -> json Person{name = name, age = 10}



-- Serve

main :: IO ()
main = do
    cfg <- defaultSpockCfg () PCNoDatabase ()
    runSpock 8080 (spock cfg app)
