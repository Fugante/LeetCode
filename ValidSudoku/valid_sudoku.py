def is_valid_sudoku(board: list[list[str]]) -> bool:
    column_sets = [set() for i in range(9)]
    square_sets = [set() for i in range(9)]
    row_set = set()
    for m, row in enumerate(board):
        for n, cell in enumerate(row):
            if not cell.isdigit():
                continue
            i = n // 3 + (3 * (m // 3))
            d = int(cell)
            col_set = column_sets[n]
            sqr_set = square_sets[i]
            if d in row_set or d in col_set or d in sqr_set:
                return False
            row_set.add(d)
            col_set.add(d)
            sqr_set.add(d)
        row_set = set()
    return True

# [["5","3",".",".","7",".",".",".","."] ,["6",".",".","1","9","5",".",".","."] ,[".","9","8",".",".",".",".","6","."] ,["8",".",".",".","6",".",".",".","3"] ,["4",".",".","8",".","3",".",".","1"] ,["7",".",".",".","2",".",".",".","6"] ,[".","6",".",".",".",".","2","8","."] ,[".",".",".","4","1","9",".",".","5"] ,[".",".",".",".","8",".",".","7","9"]]
