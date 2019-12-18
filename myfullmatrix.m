%another method to generate a full-rank matrix in a finite field
function [ fMat ] = myfullmatrix( size, nFieldSize )
% size-by-size matrix, m is the order of Galios field

% first, obtain a low triangle matrix.
LowMat = zeros(size, size);
UpMat = zeros(size, size);
for i=1:1:size
    for j=1:1:size
       if j<=i
            LowMat(i,j) = randint(1,1,[1, nFieldSize-1]);
       end
    end
end
%LowMat
for i=1:1:size
    for j=1:1:size
       if j>=i
            UpMat(i,j) = randint(1,1,[1, nFieldSize-1]);
       end
    end
end
%UpMat
%gfLow = gf(LowMat, m);
%gfUp = gf(UpMat, m);

%mat = ones(size, size);
%fMat = gf(mat, m);
fMat = mod(LowMat*UpMat,nFieldSize);
%rank(fMat);

end
