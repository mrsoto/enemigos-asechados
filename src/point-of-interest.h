#ifndef POINT_OF_INTEREST_H_INCLUDED
#define POINT_OF_INTEREST_H_INCLUDED

#include <stdint.h>
#include <vector>
#include <utility>
#include <functional>

namespace poi {
    typedef std::pair<uint32_t, uint32_t> point;

    inline auto
    make_point(const uint32_t first, const uint32_t secund) -> point {
        return std::make_pair(first, secund);
    }

    auto distance(const point&, const point&) -> uint32_t;
    auto distance(const point& point, const uint32_t first, const uint32_t second) -> uint32_t;

    auto min_distance(const std::vector<point>& points, uint32_t row, uint32_t col) -> uint32_t;
}

#endif // POINT-OF-INTEREST_H_INCLUDED
