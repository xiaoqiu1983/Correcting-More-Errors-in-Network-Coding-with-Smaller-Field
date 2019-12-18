%  exEuclid of two numbers a and b

function [b,x,y] = exEuclid( a,b )
    x0 = 1; y0 = 0;
    x1 = 0; y1 = 1;
    x = 0; y = 1;
    r = mod(a,b);
    q = ( a - r ) / b;
    while( r )
        
        x = x0 - q * x1;  y = y0 - q * y1;
        x0 = x1; y0 = y1;
        x1 = x; y1 = y;
        a = b; b = r; r = mod(a,b);
        q = ( a - r ) / b;
           
    end



