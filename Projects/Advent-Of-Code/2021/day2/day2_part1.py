# Open/Close TXT file (read mode) to get the input data
with open('inputs.txt', "r") as inputs:
    # read file inputs.txt
    data = [linha for linha in inputs.read().split("\n")]

#initialize variables
horizontal_position = 0
depth_position = 0

# loop with enumerate to get the index and the current element of data. 
for index, i in enumerate(data):
    if "forward" in i:
        horizontal_position += int(i[- 1])
    elif "up" in i:
        depth_position -= int(i[- 1])
    elif "down" in i:
        depth_position += int(i[- 1])

# Print results
print(f"Horizontal Position: {horizontal_position}")
print(f"Depth Position: {depth_position}")
print(f"'Horizontal' multiplied by 'Depth' positions: {horizontal_position * depth_position}")
