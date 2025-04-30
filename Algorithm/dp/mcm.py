# Given matrix dimensions
p = [5,10,1,5,4,10]
n = len(p) - 1  # number of matrices

# Initialize tables
m = [[0] * n for _ in range(n)]
s = [[0] * n for _ in range(n)]

# Fill the m and s tables using the Matrix Chain Multiplication DP algorithm
for l in range(2, n + 1):  # l is chain length
    for i in range(n - l + 1):
        j = i + l - 1
        m[i][j] = float('inf')
        for k in range(i, j):
            q = m[i][k] + m[k + 1][j] + p[i] * p[k + 1] * p[j + 1]
            if q < m[i][j]:
                m[i][j] = q
                s[i][j] = k

# Print the m and s tables for easier reading
print("m table (minimum costs):")
for row in m:
    print(row)

print("\ns table (splits):")
for row in s:
    print(row)
