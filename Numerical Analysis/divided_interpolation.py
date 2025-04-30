def divided_diff(x, y):
    n = len(y)
    coef = [y[0]]
    for j in range(1, n):
        for i in range(n - 1, j - 1, -1):
            y[i] = (y[i] - y[i - 1]) / (x[i] - x[i - j])
        coef.append(y[j])
    return coef

def newton_poly(coef, x_data, x):
    n = len(coef) - 1
    p = coef[n]
    for k in range(1, n + 1):
        p = coef[n - k] + (x - x_data[n - k]) * p
    return p

# Example usage
x = [1, 2, 3, 4]
y = [1, 4, 9, 16]

coef = divided_diff(x, y)
print("Divided difference coefficients:", coef)

x_val = 2.5
y_val = newton_poly(coef, x, x_val)
print(f"Interpolated value at x = {x_val} is y = {y_val}")