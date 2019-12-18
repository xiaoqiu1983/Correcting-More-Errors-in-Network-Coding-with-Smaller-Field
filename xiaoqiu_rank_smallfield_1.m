
% The data in Fiugre 1 in the paper comes from this program
clear;
% y=T'*Y - T'*T"*(Z-Ly) where T'is the inverse of decoding matrix in the sink, T"is the tranfer matrix of error vector
%                       L is the coding vector in error packets. y is the source message. Y is the received message in the sink.
%                       the purpose is to see Z is how affected by the T'*T",and L. for clarity, we think T"*(Z-Ly) represents Z. this is reasonable because they are all random. you can see all the components is nonzero
%                       assume it presents T"*(Z-Ly) which are random is konwn and random and to control ; it presents T"*(Z-Ly) which are random, to see how T'effect T'*T"*(Z-Ly)  .
%                       depend on different size of field. it is mainly for non-coherent network,

Q=[2,3,5,7,11,13,17,19,23,29,31];

Q=[5];

for jj=1:10;
for z=1:length(Q);

cut=5*Q(z);



T=myfullmatrix(cut,cut);
n=round(cut*1);%  the number of errors
m=cut;

e0=randint(n,m,[0,Q(z)-1]);
Tzy=randint(m,n,[0,Q(z)-1]);

e1=mymul(Tzy,e0,Q(z));

e2=mymul(T,e1,Q(z));


r= worank(e2,Q(z));                          
ccc=r/m;

v(jj,z)=ccc;

end


 end

sum=0;
for kk=1:size(v,1);
  sum=sum+v(kk,:);  
end
v;
y=sum/size(v,1)
x=Q;

plot(x,y,'--b','linewidth',2);
axis([0,31,0.4,1.2]);
set(gca,'xtick',[2,3,5,7,11,13,17,19,23,29,31])
set(gca,'xticklabel',{'2','3','5','7','11','13','17','19','23','29','31'})
xlabel('The size of field');
ylabel('The normalized spread error rate in non-coherent network');

set(gca,'FontName','Times New Roman','FontSize',11); 
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',11); 
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',11); 
set(get(gca,'Title'),'FontName','Times New Roman','FontSize',11); 