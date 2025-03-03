n = 5
x = [1.0,1.3,1.6,1.9,2.2]
y = [0.7651977, 0.6200860, 0.4554022, 0.2818186, 0.1103623]
x0 = 1.6

def lagrange(x, y, x0):
    n = len(x)
    sum = 0
    for i in range(n):
        product = y[i]
        for j in range(n):
            if i != j:
                product *= (x0 - x[j])/(x[i] - x[j])
        sum += product
    return sum

print(round(lagrange(x, y, x0), 7))


