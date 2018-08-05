{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
module Model where

import ClassyPrelude.Yesod
import Database.Persist.Quasi

-- Syntax for Persistent entities:
--   https://github.com/yesodweb/persistent/blob/master/docs/Persistent-entity-syntax.md
--
-- You can find more information on persistent and how to declare entities at:
--   http://www.yesodweb.com/book/persistent/
--
-- You can define all of your database entities in an external file.
-- share [mkPersist sqlSettings, mkMigrate "migrateAll"]
--     $(persistFileWith lowerCaseSettings "config/models")
--
-- We will declare database entities here so that any tools that watch
-- for file changes will recompile this file when the schema changes.

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
User
    ident Text
    password Text Maybe
    UniqueUser ident
    deriving Typeable
Email
    email Text
    userId UserId Maybe
    verkey Text Maybe
    UniqueEmail email
Comment json -- Adding "json" causes ToJSON and FromJSON instances to be derived.
    message Text
    userId UserId Maybe
    deriving Eq
    deriving Show
|]
