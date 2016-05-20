module Handler.NotificationsSpec (spec) where

import TestImport

spec :: Spec
spec =
  withApp $ do
    it "loads /notifications" $ do
      get NotificationsR
      statusIs 200
