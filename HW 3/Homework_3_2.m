%% Problem 2

A = [ 2 -1  0  0 
     -1  2 -1  0
      0 -1  2 -1
      0  0 -1  2 ];
  
b = [
    1
    1
    1
    1
    ]
  
[L U] = lu(A)

y = L\b
x = U\y