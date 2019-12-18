% The data in Fiugre 2 in the paper comes from this program
clear;

Q=[2,3,5,7,11,13,17,19,23,29,31];

n=5;

for jj=1:10;%circle jj times
for z=1:length(Q);%length(Q)is the number of finite fields

   

T=randint(n,n,[0,Q(z)-1])

r= worank(T,Q(z));                          
ccc=n-r;%the declined amount about the rank of matrix

v(jj,z)=ccc

end

 end

sum=0;
for kk=1:size(v,1);
  sum=sum+v(kk,:);  
end
yy=sum/size(v,1)
y=yy/n;
x=Q;

plot(x,y,'--b','linewidth',2);
axis([0,31,0,0.5]);
set(gca,'xtick',[2,3,5,7,11,13,17,19,23,29,31])
set(gca,'xticklabel',{'2','3','5','7','11','13','17','19','23','29','31'})
xlabel('The size of field');
ylabel('The normalized spread error rate in non-coherent network');

set(gca,'FontName','Times New Roman','FontSize',11); 
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',11); 
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',11); 
set(get(gca,'Title'),'FontName','Times New Roman','FontSize',11); 