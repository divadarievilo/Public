"""
Jogo do Galo -- [versão não gráfica]
Tic Tac Toe -- [noGUI version]
"""


board = [
    ["-", "-", "-"],
    ["-", "-", "-"],
    ["-", "-", "-"]
]
count_pos = 0


def print_board(board):
    for linha in board:
        for i in linha:
            print(f"{i} ", end="")
        print()


def check_user_input(user_input):
    if user_input.isnumeric():
        if int(user_input) in range(1, 10):
            return True
        else:
            print("Input not in range. Try again.")
            return False
    else:
        print("Invalid input. Try again.")
        return False


def check_position(user_input, board, count_pos):
    user_input = int(user_input) - 1
    row = user_input // 3
    col = user_input
    if col > 2:
        col = int(col % 3)

    if board[row][col] != "-":
        print("This position is already taken.\n")
        count_pos -= 1
        return True
    else:
        if count_pos % 2:
            board[row][col] = "O"
            return False
        else:
            board[row][col] = "X"
            return False


def check_row(board):
    for line in board:
        for i in line:
            if i != "-":
                if line[0] == line[1] and line[0] == line[2]:
                    return quit_game("q", board)
    return False


def check_col(board):
    for col in range(2, 3):
        for row in range(3):
            if board[col][row] != "-":
                if board[col][row] == board[col-1][row] and board[col][row] == board[col-2][row]:
                    return quit_game("q", board)
    return False


def check_diag(board):
    for col in range(2, 3):
        for row in range(3):
            if board[col][row] != "-":
                if board[0][0] == board[1][1] and board[0][0] == board[2][2]:
                    return quit_game("q", board)
                elif board[0][2] == board[1][1] and board[0][2] == board[2][0]:
                    return quit_game("q", board)
    return False


def is_possible(board):
    for col in range(3):
        for row in range(3):
            if board[col][row] == "-":
                return False
    return quit_game("q", board)


def quit_game(user_input, board):
    if user_input.lower() == "q" or user_input.lower() == "quit":
        print("\nThank you for playing.")
        print("The finished game was this: ")
        print_board(board)
        return True

    return False


while True:
    print_board(board)
    user_input = input("\nChoose a number 1 - 9 or type 'q' or 'quit' to exit:\n")
    if quit_game(user_input, board): break

    if not check_user_input(user_input): continue

    check_position(user_input, board, count_pos)

    count_pos += 1  # change symbol for 'X' or 'O'

    if check_row(board): break
    if check_col(board): break
    if check_diag(board): break
    if is_possible(board): break
