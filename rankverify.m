%T*G��G is a MDSmatrix ��Tis full rank , then choose a square matrix from T*G��and compute the rank of this square matrix 

function M = rankverify(m_nN1,m_nK1,nFieldSize1,nFieldSize2)

G=generateMDS(m_nK1,m_nN1,nFieldSize1);

T=generateMDS(m_nN1,m_nN1,nFieldSize2);

A=mod(T*G,nFieldSize2);

v=randperm(m_nN1,m_nK1);%����m_nK1�����ظ�����

for i=1:m_nK1
   
  B(i,:)=A(v(i),:);  
    
end


M=gfrank(B,nFieldSize2)%��nFieldSizeΪ����ʱ��MATLAB�ṩ�������������Ϊ2^m�η�ʱ�������ԣ���ʱ������gf�������������ֱ�Ϊ��0��2^m-1��

                        %mod(det(B),nFieldSize)

end

