%find the rank of a matrix in a finite field
function rk = mygfrank(a, p)
%GFRANK Compute the rank of a matrix over a Galois field.
%   RK = GFRANK(A, P) calculates the rank of matrix in GF(P).
%
%   Note: This function performs computations in GF(P^M) where P is odd. To work
%   in GF(2^M), use the RANK function with Galois arrays.
%
%   See also GFLINEQ GF/RANK.

%   The method used here is similar to the Gaussian elimination.
%   The algorithm has taken advantage of the binary computation,
%   and double sided elimination has been used.

%   Copyright 1996-2011 The MathWorks, Inc.

if nargin < 1
    error(message('comm:gfrank:NotEnoughInputs'))
elseif nargin < 2
    p = 2;
end;

% make matrix A a long matrix.
[n, m] = size(a);
if n < m
    a = a';
end;

x = a(:);
if ((max(x) >=p) || (min(x) < 0) || any(any(floor(x)~=x)))
    error(message('comm:gfrank:InvalidElementsInAB'))
end;
[n, m] = size(a);
k = 1;
i = 1;
ii = [];
kk = [];

% forward major element selection
while (i <= n) && (k <= m)
    % make the diagonal element into 1, or jump one line.
    while (a(i,k) == 0) && (k <= m)
        ind = find(a(i:n, k) ~= 0);
        if isempty(ind) && (k == m)
            break;
        elseif isempty(ind)
            k = k + 1;
        else
            indx = find(a(i:n, k) == 1);
            if isempty(indx)
               ind_major = ind(1);
            else
               ind_major = indx(1);
            end;
            j = i + ind_major - 1;
            tmp = a(i, :);
            a(i,:) = a(j, :);
            a(j, :) = tmp;
        end;
    end;

    %����matlab�ṩ�Ŀ⺯��gfrank���Ұ����õ��������my��mygfrank������gfrank�����õ���a(j, vec) = mod(a(j, vec) + a(i, vec) * (p - a(j, k)),
% p)����Ī����������㣬���������Сʱ�������ԣ�������֮��rank����Ϊ0�������Լ�ʵ�����������ϵĳ������㣬�����Ϳ��԰������ڵķ��������������rank�������
%����������ʱ��������worank�����ᵽgfrank����
    % clear all nonzero elements in the column except the major element.
    if (a(i,k) ~= 0)
     % to make major element into 1
        if (a(i,k) ~= 1)
%            a(i,:) = rem(a(i,k)^(p-2) * a(i,:), p);
             a(i,:) = mod(a(i,k)^(p-2) * a(i,:), p);
        end;
        ind = find(a(:,k) ~= 0)';
        ii = [ii i];
        kk = [kk k];
        vec = (k:m);
        for j = ind
            if j > i
                % to make sure the column will be zero except the major element.
%                 a(j, vec) = rem(a(j, vec) + a(i, vec) * (p - a(j, k)), p);
                  a(j, vec) = mod(a(j, vec) + a(i, vec) * (p - a(j, k)), p);
            end;
        end;
        k = k + 1;
    end;
    i = i + 1;
end;

rk = find(sum(a')>0,1,'last');
if isempty(rk)
    rk = 0;
end

% eof