module Handler.Post.DelSpec where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get (PostDelR "foo")
        statusIs 200
