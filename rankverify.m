%T*G，G is a MDSmatrix ，Tis full rank , then choose a square matrix from T*G，and compute the rank of this square matrix 

function M = rankverify(m_nN1,m_nK1,nFieldSize1,nFieldSize2)

G=generateMDS(m_nK1,m_nN1,nFieldSize1);

T=generateMDS(m_nN1,m_nN1,nFieldSize2);

A=mod(T*G,nFieldSize2);

v=randperm(m_nN1,m_nK1);%挑出m_nK1个不重复的行

for i=1:m_nK1
   
  B(i,:)=A(v(i),:);  
    
end


M=gfrank(B,nFieldSize2)%当nFieldSize为素数时，MATLAB提供了这个函数，当为2^m次方时，不可以，此时得先用gf（）函数把数字变为（0，2^m-1）

                        %mod(det(B),nFieldSize)

end

