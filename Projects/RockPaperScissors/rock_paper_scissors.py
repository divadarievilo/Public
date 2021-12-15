"""
Simple Game
   PT:  Pedra - Papel - Tesoura
EN/US:  Rock - Paper - Scissors
"""

# Initialize variables
count_a = 0
count_b = 0
count_tie = 0
total_games = 0


def is_input_valid(user__a, user__b):
    if user__a.isnumeric() and user__b.isnumeric():
        if int(user__a) not in range(1, 4) or int(user__b) not in range(1, 4):
            print("Not in range. Must be '1', 2' or '3'.")
            return True
    else:
        print("Not valid number. Must be '1', '2' or '3'.")
        return True
    return False


def player_a(user__a, user__b):
    if user__a == "1" and user__b == "3":
        print("Player A is the winner - Rock won Scissors!")
        return True
    elif user__a == "3" and user__b == "2":
        print("Player A is the winner - Scissors won Paper!")
        return True
    elif user__a == "2" and user__b == "1":
        print("Player A is the winner - Paper won Rock!")
        return True
    return False


def player_b(user__a, user__b):
    if user__b == "1" and user__a == "3":
        print("Player B is the winner - Rock won Scissors!")
        return True
    elif user__b == "3" and user__a == "2":
        print("Player B is the winner - Scissors won Paper!")
        return True
    elif user__b == "2" and user__a == "1":
        print("Player B is the winner - Paper won Rock!")
        return True
    return False


def tie(user__a, user__b):
    if user__a == user__b:
        print("It was a tie.")
        return True
    return False


def check_winner_or_tie(user__a, user__b):
    global total_games
    total_games += 1
    if player_a(user__a, user__b):
        global count_a
        count_a += 1
        return count_a
    elif player_b(user__a, user__b):
        global count_b
        count_b += 1
        return count_b
    elif tie(user_A, user_B):
        global count_tie
        count_tie += 1
        return count_tie
    return False


def quit_game(input_to_exit, count__a, count__b, total__games):
    if input_to_exit.lower() == "q" or input_to_exit.lower() == "quit":
        print("\nThank you for playing.")
        print(f"Player A: {count__a} , Player B: {count__b}")
        print(f"Ties: {count_tie}\nTotal games: {total__games}")
        print("Exiting game...")
        return True
    return False


while True:
    print("\n\nInput 1 - 2 - 3, as Rock - Paper - Scissors")

    # Input from Player A and check if user wants to quit.
    user_A = input("Player A: ")
    if quit_game(user_A, count_a, count_b, total_games): break

    # Input from Player B and check if user wants to quit
    user_B = input("Player B: ")
    if quit_game(user_B, count_a, count_b, total_games): break

    # Check if the input is valid and in range
    if is_input_valid(user_A, user_B): continue

    # Check Winner (player A or player B) or Tie
    if check_winner_or_tie(user_A, user_B): continue
