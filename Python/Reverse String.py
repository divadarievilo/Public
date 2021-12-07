string = input("String to reverse: ")
string_list = list(string)
final_string = ""

for a in range(len(string_list)):
    final_string += string_list.pop()

print(final_string)