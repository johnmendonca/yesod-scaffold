{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE ViewPatterns      #-}
{-# LANGUAGE QuasiQuotes       #-}
module Foundation where

import Yesod.Core

data App = App

mkYesodData "App" [parseRoutes|
/              HomeR GET
/add/#Int/#Int AddR  GET
|]

instance Yesod App
