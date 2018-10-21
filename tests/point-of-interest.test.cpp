#include "catch2/catch.hpp"

#include <vector>
#include <utility>

#include "point-of-interest.h"

using poi::point;

TEST_CASE("point distance", "[poi]") {
    REQUIRE((poi::distance(point(1, 1), point(1, 1)) == 0));
    REQUIRE((poi::distance(point(0, 1), point(1, 1)) == 1));
    REQUIRE((poi::distance(point(1, 0), point(1, 1)) == 1));
    REQUIRE((poi::distance(point(10, 10), point(0, 0)) == 20));
}
