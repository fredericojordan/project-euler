import copy
import random
import math


class SudokuBoard(list):
    EMPTY_POS = '0'
    SYMBOLS = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

    def __init__(self, number_list=None):
        super().__init__()
        if number_list:
            self.setup_board_from_list(number_list)
        else:
            self.setup_initial_board()

    def setup_initial_board(self):
        self.setup_empty_board()

    def setup_board_from_list(self, number_list):
        del self[:]
        for line in number_list:
            self.append([char for char in line])

    def setup_empty_board(self):
        del self[:]
        for _ in range(len(SudokuBoard.SYMBOLS)):
            self.append([SudokuBoard.EMPTY_POS for _ in range(len(SudokuBoard.SYMBOLS))])

    def _print(self):
        for i in range(len(SudokuBoard.SYMBOLS)):
            print(str(self[i]))
        print('')

    def get_symbol(self, pos):
        return self[pos[0]][pos[1]]

    def is_pos_empty(self, pos):
        return self.get_symbol(pos) == SudokuBoard.EMPTY_POS

    def is_board_full(self):
        for pos in self.get_all_positions():
            if self.is_pos_empty(pos):
                return False
        return True

    def solve(self):
        return self.populate_via_global_min()

    def populate_via_global_min(self):
        while not self.is_board_full():
            min_pos = self.get_global_min()
            if not self.fill_pos(min_pos):
                return False
        return True

    def populate_boxes(self):
        for i in range(len(SudokuBoard.SYMBOLS)):
            if not self.populate_box_from_min(i):
                return False
        return True

    def get_box_size(self):
        return int(math.sqrt(len(SudokuBoard.SYMBOLS)))

    def populate_box_sequencial(self, box_num):
        for position in self.get_positions_from_box(box_num):
            if not self.fill_pos(position):
                return False
        return True

    def populate_box_from_min(self, box_num):
        while not self.is_box_full(box_num):
            min_pos = self.get_min_from_box(box_num)
            if not self.fill_pos(min_pos):
                return False
        return True

    def is_box_empty(self, bom_num):
        for pos in self.get_positions_from_box(bom_num):
            if not self.is_pos_empty(pos):
                return False
        return True

    def is_box_full(self, box_num):
        for pos in self.get_positions_from_box(box_num):
            if self.is_pos_empty(pos):
                return False
        return True

    def get_min_from_box(self, box_num):
        return self.get_min(self.get_positions_from_box(box_num))

    def get_global_min(self):
        return self.get_min(self.get_all_positions())

    def get_min(self, position_list):
        min_c = len(SudokuBoard.SYMBOLS)
        for pos in position_list:
            if not self.is_pos_empty(pos):
                continue
            count = self.count_candidates(pos)
            if count <= min_c:
                min_c = count
                min_pos = pos
        return min_pos

    def get_all_positions(self):
        return [(i, j) for i in range(len(SudokuBoard.SYMBOLS)) for j in range(len(SudokuBoard.SYMBOLS))]

    def get_all_positions_random(self):
        pos_list = self.get_all_positions()
        random.shuffle(pos_list)
        return pos_list

    def fill_pos(self, position):
        if not self.is_pos_empty(position):
            return True
        else:
            return self.fill_in_certain(position)
            # return self.fill_in_random(position)

    def fill_in_certain(self, position):
        candidates = self.get_candidates(position)

        if len(candidates) == 1:
            self[position[0]][position[1]] = candidates[0]
            return True
        else:
            return False

    def fill_in_random(self, position):
        candidates = self.get_candidates(position)

        if len(candidates) < 1:
            return False
        else:
            i = random.randint(0, len(candidates) - 1)
            self[position[0]][position[1]] = candidates[i]
            return True

    def get_candidates(self, position):
        candidates = copy.deepcopy(SudokuBoard.SYMBOLS)

        self.remove_same_row(candidates, position)
        self.remove_same_col(candidates, position)
        self.remove_same_box(candidates, position)

        return candidates

    def count_candidates(self, position):
        return len(self.get_candidates(position))

    def remove_same_row(self, candidates, position):
        for row_pos in self.get_same_row(position):
            s = self.get_symbol(row_pos)
            if s in candidates:
                candidates.remove(s)

    def remove_same_col(self, candidates, position):
        for col_pos in self.get_same_col(position):
            s = self.get_symbol(col_pos)
            if s in candidates:
                candidates.remove(s)

    def remove_same_box(self, candidates, position):
        for box_pos in self.get_same_box(position):
            s = self.get_symbol(box_pos)
            if s in candidates:
                candidates.remove(s)

    def get_positions_from_box(self, box_num):
        box_size = self.get_box_size()
        a = int(box_num / box_size)
        b = box_num % box_size
        return [(box_num + box_size * a, j + box_size * b) for box_num in range(box_size) for j in range(box_size)]

    def get_box_from_position(self, pos):
        box_size = self.get_box_size()
        a = int(pos[0] / box_size)
        b = int(pos[1] / box_size)
        return b + a * box_size

    def get_same_box(self, pos):
        return self.get_positions_from_box(self.get_box_from_position(pos))

    def get_same_col(self, pos):
        return [(i, pos[1]) for i in range(len(SudokuBoard.SYMBOLS))]

    def get_same_row(self, pos):
        return [(pos[0], i) for i in range(len(SudokuBoard.SYMBOLS))]

    def clear_symbol(self, pos):
        self[pos[0]][pos[1]] = SudokuBoard.EMPTY_POS

    def set_symbol(self, pos, symbol):
        self[pos[0]][pos[1]] = symbol

    def empty_count(self):
        count = 0
        for pos in self.get_all_positions():
            if self.is_pos_empty(pos):
                count += 1
        return count

    def filled_count(self):
        count = 0
        for pos in self.get_all_positions():
            if not self.is_pos_empty(pos):
                count += 1
        return count


if __name__ == "__main__":
    accumulator = 0
    solved_count = 0
    total_count = 0
    with open("p096_sudoku.txt") as file:
        board = []
        for line in file.readlines():
            if line.startswith("Grid"):
                board = []
            else:
                board.append(line[:9])

            if len(board) == 9:
                total_count += 1
                b = SudokuBoard(board)
                if b.solve():
                    solved_count += 1
                    accumulator += int(''.join(b[0][:3]))

    if solved_count == total_count:
        print(accumulator)
    else:
        print("Could only solve {} of the {} problems.".format(solved_count, total_count))
