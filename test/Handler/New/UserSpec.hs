module Handler.New.UserSpec (spec) where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get NewUserR
        statusIs 200
