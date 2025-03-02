#include <bits/stdc++.h>
using namespace std;

int main()
{
    int n, cap;
    cin >> n >> cap;
    vector<int> wt(n), val(n);
    for (int i = 0; i < n; i++)
    {
        cin >> val[i] >> wt[i];
    }

    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));

    for (int i = 1; i <= n; i++)
    {
        for (int w = 0; w <= cap; w++)
        {
            if (wt[i - 1] <= w)
            {
                dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - wt[i - 1]] + val[i - 1]);
            }
            else
            {
                dp[i][w] = dp[i - 1][w];
            }
        }
    }

    cout << dp[n][cap] << endl;

    return 0;
}
