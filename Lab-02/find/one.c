#include <stdio.h>
int main()
{
    int m[] = {10, 30, 50, 40, 90, 80};
    int x;
    scanf("%d", &x);
    int found = 0;
    for (int i = 0; i < 6; i++)
    {
        if (m[i] == x)
        {
            found = 1;
        }
    }
    if (found == 1)
    {
        printf("Found");
    }
    else
    {
        printf("Not Found");
    }
}