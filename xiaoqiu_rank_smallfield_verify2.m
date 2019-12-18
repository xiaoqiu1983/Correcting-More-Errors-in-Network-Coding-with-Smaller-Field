
% The data in Table 1 in the paper comes from this program
clear;
m_nK1=7;
m_nN1=13;
nFieldSize2=3;
n=2;%cut
nFieldSize1=nFieldSize2^n;
k=3;%  the decline amout of T





G=generateMDS(m_nK1,m_nN1,nFieldSize1);

T=randint(m_nN1,m_nN1,[0,nFieldSize2-1]);%initiate T  

while worank(T,nFieldSize2)~=m_nN1-k
T=randint(m_nN1,m_nN1,[0,nFieldSize2-1]);
end

% T=generateMDS(m_nN1,m_nN1,nFieldSize2);

A=mod(T*G,nFieldSize1);

v=randperm(m_nN1,m_nK1);%     choose m_nK1 Non-repeating rows  

for i=1:m_nK1-k
   
  B(i,:)=A(v(i),:);  
    
end


M=gfrank(B,nFieldSize1)
N=worank(B,nFieldSize1)
is=(N>=m_nK1-k)


