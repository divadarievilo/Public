# import/open TXT file
with open('inputs.txt', "r") as inputs:
    # read file inputs.txt
    data = [line for line in inputs.read().split("\n")]


# initialize variables
count_zero = count_one = 0
gama = []
epsilon = []


# get the value of "gama rate"
for i in range(12):
    for index, num in enumerate(data):
        if num[i] == "0":
            count_zero += 1
        else:
            count_one += 1

    if count_one > count_zero:
        gama.append(1)
        epsilon.append(0)
    else:
        gama.append(0)
        epsilon.append(1)

    count_zero = count_one = 0


# Transform Binary into Decimal
gama_dec = int("".join(str(i) for i in gama), 2)
epsilon_dec = int("".join(str(i) for i in epsilon), 2)


# Print values to console
print(f"Gama Calculated:  {gama}")
print(f"Epsilon Calculated:  {epsilon}")
print(f"Gama Calculated (toDecimal):  {gama_dec}")
print(f"Epsilon Calculated (toDecimal):  {epsilon_dec}\n")
print(f"Final Calculation (gama * epsilon):  {gama_dec*epsilon_dec}")
