#include "catch2/catch.hpp"

#include <iostream>
#include <vector>
#include <utility>
#include <string>
#include <climits>
#include "point-of-interest.h"
#include "distance-calculator.h"

using std::vector;
using poi::point;
using std::equal;
using std::cbegin;
using std::cend;
using Catch::Matchers::Equals;

SCENARIO("GIVEN a Distance calculator function", "[distance]") {

    WHEN("no poi exists") {
        const uint32_t N = 2, M = 2;
        vector<point> points_of_interest(0);

        THEN("the distance is UINT_MAX for every single node") {
            vector<uint32_t> expected{UINT_MAX, UINT_MAX, UINT_MAX, UINT_MAX};
            auto actual = calc::ComputarEnemigos(N, M, points_of_interest);
            REQUIRE_THAT(*actual, Equals(expected));
        }
    }

    WHEN("one poi exist at begening") {
        const uint32_t N = 2, M = 2;
        vector<point> points_of_interest{
            {0, 0}};

        THEN("all distances correspond to this point") {
            vector<uint32_t> expected{0, 1, 1, 2};
            auto actual = calc::ComputarEnemigos(N, M, points_of_interest);
            REQUIRE_THAT(*actual, Equals(expected));
        }
    }

    WHEN("when two opposit poi exists") {
        const uint32_t N = 3, M = 3;
        vector<point> points_of_interest{
            {0, 0},
            {2, 2}};

        THEN("distances a evaluated according to these two points") {
            vector<uint32_t> expected{
                0, 1, 2,
                1, 2, 1,
                2, 1, 0};
            auto actual = calc::ComputarEnemigos(N, M, points_of_interest);
            REQUIRE_THAT(*actual, Equals(expected));
        }
    }

    WHEN("when three poi exists") {
        const uint32_t N = 5, M = 5;
        vector<point> points_of_interest{
            {0, 0},
            {2, 1},
            {2, 2}};

        THEN("all points are evaluated for every sigle node") {
            vector<uint32_t> expected
                    {
                0, 1, 2, 3, 4,
                1, 1, 1, 2, 3,
                1, 0, 0, 1, 2,
                2, 1, 1, 2, 3,
                3, 2, 2, 3, 4}
            ;
            auto actual = calc::ComputarEnemigos(N, M, points_of_interest);
            REQUIRE_THAT(*actual, Equals(expected));
        }
    }
}