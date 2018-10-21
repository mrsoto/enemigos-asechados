#include <vector>
#include <algorithm>
#include <numeric>
#include <utility>
#include <cmath>
#include <climits>

#include"./point-of-interest.h"

using std::min;
using std::vector;
using std::min_element;
using std::accumulate;

namespace poi {

    auto
    absolute_diff(uint32_t a, uint32_t b) -> uint32_t {
        return a < b ? b - a : a - b;
    }

    auto
    distance(const point& a, const point& b) -> uint32_t {
        return distance(a, b.first, b.second);
    }

    auto distance(const point& point, const uint32_t first, const uint32_t second) -> uint32_t {
        return absolute_diff(point.first, first) +
                absolute_diff(point.second, second);
    }

    auto
    min_distance(const std::vector<point>& points, const uint32_t row, const uint32_t col) -> uint32_t {
        return accumulate(
                cbegin(points),
                cend(points),
                UINT_MAX,
                [row, col](auto previous, auto element) {
                    return min(previous, distance(element, row, col));
                });
    }
}
