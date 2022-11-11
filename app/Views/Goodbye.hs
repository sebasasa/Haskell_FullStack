{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
module Views.Goodbye(goodbye_) where

import Layouts.Base
import Web.Spock.Lucid (lucid)
import Lucid


goodbye_ :: Html ()
goodbye_ =  baseLayout $ div_ (h1_ ("Goodbye"))