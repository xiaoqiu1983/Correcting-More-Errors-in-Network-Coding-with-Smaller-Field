
% find the inverse of nunber of a finite field
function x = invprime( a,p )

     
%     r = exEuclid(a,p);
    [r,x,y]= exEuclid(a,p);
    if ( r~= 1 ) 
        return;
    end
    
    x = mod(x, p);
    if ( x < 0 ) 
        x =x + p;
     end
end

