{-

Write function bmi that calculates body mass index (bmi = weight / height2).

if bmi <= 18.5 return "Underweight"

if bmi <= 25.0 return "Normal"

if bmi <= 30.0 return "Overweight"

if bmi > 30 return "Obese"
=============
EXAMPLE:

main = hspec spec
spec = do
  describe "The bmi function" $ do
    it "should work for some examples" $ do
      bmi 50 1.80 `shouldBe` "Underweight"
      bmi 80 1.80 `shouldBe` "Normal"
      bmi 90 1.80 `shouldBe` "Overweight"
      bmi 110 1.80 `shouldBe` "Obese"


-}


bmi :: Float -> Float -> String  
bmi weight height | weight / (height ^ 2) <=18.5 = "Underweight"
                  | weight / (height ^ 2) <=25.0 = "Normal"
                  | weight / (height ^ 2) <=30.0 = "Overweight"
                  | weight / (height ^ 2) > 30 = "Obese"


