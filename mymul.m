
%a function to find the product of two numbers in a finite field
function C = mymul( A,B,nFieldSize )
%A*B=C
[m,n] = size(A);
k=size(B,2);
for i=1:m
for j=1:k
temp=0;
for z=1:n
   
    temp=A(i,z) * B(z,j)+temp;
    
end
C(i,j)=mod(temp,nFieldSize);

end
end

