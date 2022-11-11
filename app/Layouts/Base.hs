{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}

module Layouts.Base(baseLayout) where
import Web.Spock.Lucid (lucid)
import Lucid

import Web.Spock
import Web.Spock.Config
import Data.Aeson        hiding (json)
import Data.Monoid       ((<>))
import Data.Text         (Text, pack)
import GHC.Generics
import Web.Spock.Lucid (lucid)
import Lucid


navbar_ = div_ ("")

baseLayout :: Html () -> Html()
baseLayout content = 
    html_ (do 
        head_ (do 
            link_ [rel_ "stylesheet", type_ "text/css", href_ "https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"]
            title_ "Hola Mundo" 
            )
        body_ (do
            navbar_
            content 
            script_ [src_ "https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"] ""
            )
        )