# Open/Close TXT file (read mode) to get the input data
with open('inputs.txt', "r") as inputs:
    # read file inputs.txt
    data = [int(linha) for linha in inputs.read().split("\n")]

# Set variables for counters
count_inc = 0
count_desc = 0

# Loop to count the number of increases/decreases while comparing "Number" with "Number - 3"
for i in range(3, len(data)):
    if data[i] > data[i-3]:
        count_inc += 1
    else:
        count_desc += 1

# print number of increases, decreases and the sum of both
print(f"Increase: {str(count_inc)}")
print(f"Decrease: {str(count_desc)}")
print(f"Sum: {str(count_inc+count_desc)}")
