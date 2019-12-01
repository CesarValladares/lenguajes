maxN = int(input('Type number: '))

result = 1

def ifDiv (maxN, result):

    for i in range(maxN):

        if result % (i+1) != 0:
            return True
    
    return False

while ifDiv(maxN, result):
    result += 1

print(result)