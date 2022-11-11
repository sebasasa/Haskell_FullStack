{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
module Views.Hello(hello_) where

import Layouts.Base
import Web.Spock.Lucid (lucid)
import Lucid


hello_ :: Html ()
hello_ =  baseLayout $ div_ (h1_ ("Hello"))