import csv

def read_csv(nfile, delimiter=','):
    data = []
    with open(nfile, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=delimiter)
        for line in reader:
            data.append(line)
    return data

dataf1 = read_csv('ejemplo1.csv')
dataf2 = read_csv('ejemplo2.csv')
index = []
i = 0
result = []

for item in dataf1:
    index.append(item[-1])
    for sublist in dataf2:
        if all(x in item for x in sublist):
            match = item
            match[-1] = index[i]
            result.append(match)
            i += 1

print(result)