-- |The role each user has
module Model.Role where

import Database.Persist.TH
import GHC.Generics
import Prelude (Eq, Read, Show)

-- |The Role
-- 
-- Each successive role is a subset of the previous role. i.e. all
-- 'Admin's have 'Moderator' powers, all 'Moderator's have 'Contributor'
-- powers, etc.
data Role = Admin
          | Moderator
          | Contributor
          | Established
  deriving (Eq, Generic, Read, Show)

derivePersistField "Role"
