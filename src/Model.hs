{-# LANGUAGE FlexibleInstances #-}

module Model where

import Model.Role

import Control.Lens.TH
import ClassyPrelude.Yesod
import Database.Persist.Quasi
import Text.Markdown
import Yesod.Text.Markdown ()

-- You can define all of your database entities in the entities file.
-- You can find more information on persistent and how to declare entities
-- at:
-- http://www.yesodweb.com/book/persistent/
share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")

makeLensesWith camelCaseFields ''Comment
makeLensesWith camelCaseFields ''Notification
makeLensesWith camelCaseFields ''Post
makeLensesWith camelCaseFields ''StaticPage
makeLensesWith camelCaseFields ''User
