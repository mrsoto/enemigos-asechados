#ifndef DISTANCE_CALCULATOR_H_INCLUDED
#define DISTANCE_CALCULATOR_H_INCLUDED

#include <stdint.h>
#include <vector>

namespace calc {

    auto ComputarEnemigos(
            uint32_t M,
            uint32_t N,
            const std::vector<std::pair<uint32_t, uint32_t>>&iP
            ) -> std::unique_ptr<std::vector<uint32_t>>;

}

#endif // DISTANCE_CALCULATOR_H_INCLUDED
