#include <bits/stdc++.h>
using namespace std;

int main()
{
    
    int n,cap;
    cin >> n >> cap;
    vector<int> wt(n),val(n);
    for(int i=0;i<n;i++)
    {
        cin >> val[i] >> wt[i];
    }
    vector<double> frac(n);
    for(int i=0;i<n;i++)
    {
        frac[i] = (double)val[i]/wt[i];
    }
    sort(frac.begin(),frac.end(),greater<double>());
    double ans = 0;
    for(int i=0;i<n;i++)
    {
        if(wt[i]<=cap)
        {
            ans += val[i];
            cap -= wt[i];
        }
        else
        {
            ans += frac[i]*cap;
            break;
        }

    }
    cout << ans << endl;
    

    return 0;
}