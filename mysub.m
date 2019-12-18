function C = mymul( A,B,nFieldSize )
% A-B=C in a finite field 
[m,n] = size(A);

for i=1:m
for j=1:n

 
  
C(i,j)=mod((A(i,j)-B(i,j)),nFieldSize);
    

end
end

