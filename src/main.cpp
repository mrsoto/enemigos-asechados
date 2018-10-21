/* 
 * File:   main.cpp
 * Author: manuel soto
 */

#include <cstdlib>
#include <iostream>
#include <memory>
#include <vector>
#include <stdint.h>

#include "./point-of-interest.h"
#include "./distance-calculator.h"

using namespace std;
using calc::ComputarEnemigos;
using poi::point;

int
main(int argc, char** argv) {
    const uint32_t N = 10000, M = 50000;

    vector<point> points_of_interest{
        {0, 0}};
    std::cout << "Matix [" << N << "x" << M << "] = " << N * M / 1024 / 1024 << "Mb" << std::endl;
    auto actual = ComputarEnemigos(N, M, points_of_interest);

    return 0;
}

