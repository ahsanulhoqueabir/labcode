#include <bits/stdc++.h>
using namespace std;

int main()
{
    int n;
    cin >> n;
    vector<int>v(n);
    for (int i = 0; i < n; i++)
        cin >> v[i];

    for (int i = 0; i < n - 1; i++)
    {
        int minIndex = i;
        for (int j = i + 1; j < n; j++)
        {
            if (v[j] < v[minIndex])
                minIndex = j;
        }
        if (minIndex != i)
        {
            cout << i << " : Swapping " << v[i] << " and " << v[minIndex] << endl;
            swap(v[i], v[minIndex]);
        }
    }
    

    return 0;
}