module Check where

data Test a b = Test String (a -> b) a b

instance (Show a, Show b) => Show (Test a b) where
    show (Test name _ input expect) = "Test (name: "  ++ show name   ++ ", "
                                   ++ "input: "       ++ show input  ++ ", "
                                   ++ "expectation: " ++ show expect ++ ")"


check :: (Show a, Show b, Eq a, Eq b) => Test a b -> String
check (Test name f input expect) = unwords [ name
                                           , nameSep
                                           , "For the input"
                                           , show input
                                           , "should output"
                                           , show expect
                                           , resultSep
                                           , show (expect == f input) ]

-- To make it easier for users
checkP :: (Show a, Show b, Eq a, Eq b) => Test a b -> IO ()
checkP = putStrLn . check

-- Sep means separator
nameSep = "|>"
resultSep = "->"