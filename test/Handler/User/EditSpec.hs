module Handler.User.EditSpec (spec) where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get (UserEditR "foo")
        statusIs 200
