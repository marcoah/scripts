with open('ejemplo1.csv', 'r') as file1:
    with open('ejemplo2.csv', 'r') as file2:
        difference = set(file1).difference(file2)

with open('diff.csv', 'w') as file_out:
    for line in difference:
        file_out.write(line)