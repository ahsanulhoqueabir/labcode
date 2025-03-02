#include <bits/stdc++.h>
using namespace std;

int lcsbt(string &s1, string &s2, int n, int m) {
    if (n == 0 || m == 0) {
        return 0;
    }
    if (s1[n-1] == s2[m-1]) {
        return 1 + lcsbt(s1, s2, n-1, m-1);
    } else {
        return max(lcsbt(s1, s2, n-1, m), lcsbt(s1, s2, n, m-1));
    }
}
int lcstb(string &s1, string &s2, int n, int m) {
    vector<vector<int>> dp(n + 1, vector<int>(m + 1, -1));
    function<int(int, int)> lcs = [&](int i, int j) {
        if (i == 0 || j == 0) {
            return 0;
        }
        if (dp[i][j] != -1) {
            return dp[i][j];
        }
        if (s1[i-1] == s2[j-1]) {
            dp[i][j] = 1 + lcs(i-1, j-1);
        } else {
            dp[i][j] = max(lcs(i-1, j), lcs(i, j-1));
        }
        return dp[i][j];
    };
    return lcs(n, m);
}

int main() {
    string s1, s2;
    cin >> s1 >> s2;
    int n = s1.length();
    int m = s2.length();
    cout << lcsbt(s1, s2, n, m) << endl;
    cout << lcstb(s1, s2, n, m) << endl;
    return 0;
}
