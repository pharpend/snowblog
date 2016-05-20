module Handler.StaticPageSpec (spec) where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get (StaticPageR "foo")
        statusIs 200
