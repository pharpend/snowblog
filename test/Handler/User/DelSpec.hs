module Handler.User.DelSpec where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get (UserDelR "foo")
        statusIs 200
