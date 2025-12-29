dictionary = {"a": "Apple", "b": "Banana", "c": "Cherries", "d": "Dragon Fruit"}

listOfKeys = dictionary.keys()
print("Type of variable listOfKeys is: ", type(listOfKeys))

listOfKeys = list(listOfKeys)

print("Printing the entire list containing all Keys: ")
print(listOfKeys)

print("Printing individual Keys stored in the list:")

for key in listOfKeys:
    print(key)