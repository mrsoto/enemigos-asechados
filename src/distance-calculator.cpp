#include <cstdlib>
#include <algorithm>
#include <vector>
#include <climits>
#include <future>
#include <thread>
#ifdef DEBUG
#include <iostream>
#endif
#include "./distance-calculator.h"
#include "./point-of-interest.h"

using std::unique_ptr;
using std::make_unique;
using std::vector;
using std::pair;
using std::next;
using std::thread;
using std::ref;
using std::max;
using poi::point;
using poi::min_distance;
using poi::make_point;

#ifndef CPU_CORES
#define CPU_CORES 4
#endif

namespace calc {

    const uint32_t MIN_CHUNK_SIZE{1000u};

    auto
    perform_distances_evaluations(
            vector<uint32_t>& board,
            const vector<pair<uint32_t, uint32_t>>&points_of_interest,
            const uint32_t begin_row,
            const uint32_t end_row,
            const uint32_t cols) -> void {

                const auto first_cell{ begin(board) + begin_row * cols};
                const auto lastest_cell{ begin(board) + end_row * cols};
                auto row_number{begin_row};
                auto cell{first_cell};

                while (cell < lastest_cell) {
                    const auto end_of_row{cell + cols};
                    uint32_t column_number{0};

                    while (cell < end_of_row) {
                        *cell = min_distance(
                                points_of_interest,
                                row_number, column_number
                                );
                        ++cell;
                        ++column_number;
                    }

                    ++row_number;
                }
            };

    auto
    partial_evaluation(
            vector<uint32_t>& board,
            const vector<pair<uint32_t, uint32_t>>&points_of_interest,
            const uint32_t begin_row,
            const uint32_t end_row,
            const uint32_t cols,
            const uint32_t minimun_chunk) -> void {

                const uint32_t current_chunk_size = (end_row - begin_row) * cols;
#ifdef DEBUG
                std::cout << "Starting from " << begin_row << " until " << end_row << " chunk size: " << current_chunk_size << "/" << minimun_chunk << std::endl;
#endif
                if (current_chunk_size <= minimun_chunk) {
                    perform_distances_evaluations(board, points_of_interest, begin_row, end_row, cols);
                } else {
                    uint32_t middle_row = (end_row + begin_row) / 2;

                    thread child = thread(partial_evaluation, ref(board), ref(points_of_interest), begin_row, middle_row, cols, minimun_chunk);
                    partial_evaluation(board, points_of_interest, middle_row, end_row, cols, minimun_chunk);
                    child.join();
                }
            }

    auto
    ComputarEnemigos(
            const uint32_t M,
            const uint32_t N,
            const vector<pair<uint32_t, uint32_t>>&points_of_interest
            ) -> unique_ptr<vector<uint32_t>>
    {
        unique_ptr<vector < uint32_t>> board = make_unique<vector < uint32_t >> (M * N);

        const uint32_t chunk_size = max(M * N / CPU_CORES, MIN_CHUNK_SIZE);
        partial_evaluation(*board, points_of_interest, 0, M, N, chunk_size);

        return board;
    }
}
