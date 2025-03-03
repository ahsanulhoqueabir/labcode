#include <bits/stdc++.h>
using namespace std;

void merge(int a[], int p, int q, int r) {
    int n1 = q - p + 1;
    int n2 = r - q;
    int L[n1 + 1], R[n2 + 1];
    for (int i = 0; i < n1; i++) L[i] = a[p + i];
    for (int i = 0; i < n2; i++) R[i] = a[q + 1 + i];
    L[n1] = INT_MAX;
    R[n2] = INT_MAX;

    int i = 0, j = 0;
    for (int k = p; k <= r; k++) {
        if (L[i] <= R[j]) {
            a[k] = L[i];
            i++;
        } else {
            a[k] = R[j];
            j++;
        }
    }
}

void merge_sort(int a[], int p, int r){
    if(p<r){
        int q = (p+r)/2;
        merge_sort(a,p,q);
        merge_sort(a,q+1,r);
        merge(a,p,q,r);
    }
}

int main()
{
    int n; cin>>n;
    int a[n];
    for(int i=0;i<n;i++) cin>>a[i];
    merge_sort(a,0,n-1);
    for(int i=0;i<n;i++) cout<<a[i]<<" ";
    
    return 0;
}