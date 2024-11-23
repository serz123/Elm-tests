module HetpFunctionsTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Main exposing (calculateFirstIntersection, calculateFinalLocation)


-- Helper function to test final location
finalLocationTests : Test
finalLocationTests =
    describe "finalLocation"
        [ test "Ends at (0, 4) after '^^^^'" <|
            \_ -> Expect.equal (calculateFinalLocation ">>>>") (4, 0)

        , test "Ends at (0, 0) after '><><'" <|
            \_ -> Expect.equal (calculateFinalLocation "^^>>vv<<") (0, 0)

        , test "Ends at (-2, 2) after '<<^^'" <|
            \_ -> Expect.equal (calculateFinalLocation "<<vv") (-2, -2)
        ]


-- Helper function to test first intersection
firstIntersectionTests : Test
firstIntersectionTests =
    describe "calculateFirstIntersection"
        [ test "Returns Nothing for no intersection" <|
            \_ -> Expect.equal (calculateFirstIntersection ">>vv") Nothing

        , test "Returns (0, 0) as first intersection" <|
            \_ -> Expect.equal (calculateFirstIntersection "><>>>>") (Just (0, 0))

        , test "Returns first intersection after multiple steps" <|
            \_ -> Expect.equal (calculateFirstIntersection "^^<<v>>>") (Just (0, 1))
        ]


-- Combine all the tests
suite : Test
suite =
    describe "Main Tests"
        [ finalLocationTests
        , firstIntersectionTests
        ]
