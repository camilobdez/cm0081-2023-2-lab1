module Main where

-- Import libraries
import Test.HUnit
import Text.Regex.Posix
import Text.Regex.TDFA

-- Define unit tests
tests :: Test
tests = TestList
  [ --Matching 'ab' with zero or more 'a's followed by 'b'
    TestCase $ assertBool "Test 1" $ Text.Regex.Posix.match
     ((Text.Regex.Posix.makeRegex "a*b") :: Text.Regex.Posix.Regex) "ab"
    --Ensuring 'c' does not match with zero or more 'a's followed by 'b'
  , TestCase $ assertBool "Test 2" (not $ Text.Regex.Posix.match
   ((Text.Regex.Posix.makeRegex "a*b") :: Text.Regex.Posix.Regex) "c")
    --Matching 'bc' with zero or more 'a's followed by 'b' and then 'c'
  , TestCase $ assertBool "Test 3" $ Text.Regex.Posix.match
   ((Text.Regex.Posix.makeRegex "a*bc") :: Text.Regex.Posix.Regex) "bc"
    --Ensuring 'acb' does not match with zero or more 'a's followed
    -- by 'b' and then 'c'
  , TestCase $ assertBool "Test 4" (not $ Text.Regex.Posix.match
   ((Text.Regex.Posix.makeRegex "a*bc") :: Text.Regex.Posix.Regex) "acb")
    --Matching 'abc' with one or more 'a's followed by one or more 'b's
    --and zero or more 'c's
  , TestCase $ assertBool "Test 5" $ Text.Regex.Posix.match
   ((Text.Regex.Posix.makeRegex "a+b+c*") :: Text.Regex.Posix.Regex) "abc"
    --Matching 'aaabbbccc' with one or more 'a's followed by one or more
    -- 'b's and zero or more 'c's
  , TestCase $ assertBool "Test 6" $ Text.Regex.TDFA.match
   ((Text.Regex.TDFA.makeRegex "a+b+c*") :: Text.Regex.TDFA.Regex) "aaabbbccc"
    --Ensuring 'def' does not match with one or more 'a's followed by
    -- one or more 'b's and zero or more 'c's
  , TestCase $ assertBool "Test 7" (not $ Text.Regex.TDFA.match
   ((Text.Regex.TDFA.makeRegex "a+b+c*") :: Text.Regex.TDFA.Regex) "def")
    --Matching 'baaaac' with zero or more 'a's, followed by 'b', followed
    -- by zero or more 'a's, followed by 'c'
  , TestCase $ assertBool "Test 8" $ Text.Regex.TDFA.match
   ((Text.Regex.TDFA.makeRegex "a*ba*c*") :: Text.Regex.TDFA.Regex) "baaaac"
    --Ensuring 'ac' does not match with zero or more 'a's, followed by 'b',
    -- followed by zero or more 'a's, followed by 'c'
  , TestCase $ assertBool "Test 9" (not $ Text.Regex.TDFA.match
   ((Text.Regex.TDFA.makeRegex "a*ba*c*") :: Text.Regex.TDFA.Regex) "ac")
    --Matching 'bc' with zero or more 'a's, followed by 'b', followed by
    --zero or more 'a's, followed by 'c'
  , TestCase $ assertBool "Test 10" $ Text.Regex.TDFA.match
   ((Text.Regex.TDFA.makeRegex "a*ba*c*") :: Text.Regex.TDFA.Regex) "bc"
  ]

-- Define main
main :: IO ()
main = do
    counts <- runTestTT tests
    putStrLn $ show counts
