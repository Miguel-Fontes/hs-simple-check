module Examples.Basic (tests) where

import Check

subject1 = Test "Reverse function" reverse
exData1      = "miguel"
expectation1 = "leugim"

exData2      = [1,2,3,4,5,6,7,8,9,0]
expectation2 = [0,9,8,7,6,5,4,3,2,1]

tests :: IO()
tests = do
    checkP (subject1 exData1 expectation1)
    checkP (subject1 exData2 expectation2)