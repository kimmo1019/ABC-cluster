global data_new

data3=data3(:,ind3);
data4=data4(:,ind4);
%normalization
for i=1:size(data1,2)
    data1(:,i)=(data1(:,i)-mean(data1(:,i)))/sqrt(var(data1(:,i)));
end
for i=1:size(data2,2)
    data2(:,i)=(data2(:,i)-mean(data2(:,i)))/sqrt(var(data2(:,i)));
end
for i=1:size(data3,2)
    data3(:,i)=(data3(:,i)-mean(data3(:,i)))/sqrt(var(data3(:,i)));
end
for i=1:size(data4,2)
    data4(:,i)=(data4(:,i)-mean(data4(:,i)))/sqrt(var(data4(:,i)));
end
R=0.85;
cov1=cov(data1);
[pc1,eig1,score1]=pcacov(cov1);%pc : principal component;eig:eigen value; 
count1=1;
while(sum(eig1(1:count1),1)<R*sum(eig1))
    count1=count1+1;
end
count1=count1-1;
cov2=cov(data2);
[pc2,eig2,score2]=pcacov(cov2);
count2=1;
while(sum(eig2(1:count2),1)<R*sum(eig2))
    count2=count2+1;
end
count2=count2-1;
cov3=cov(data3);
[pc3,eig3,score3]=pcacov(cov3);
count3=1;
while(sum(eig3(1:count3),1)<R*sum(eig3))
    count3=count3+1;
end
count3=count3-1;
cov4=cov(data4);
[pc4,eig4,score4]=pcacov(cov4);
count4=1;
while(sum(eig4(1:count4),1)<R*sum(eig4))
    count4=count4+1;
end
count4=count4-1;
data1_new=data1*pc1;
data1_new=data1_new(:,1:count1);
data2_new=data2*pc2;
data2_new=data2_new(:,1:count2);
data3_new=data3*pc3;
data3_new=data3_new(:,1:count3);
data4_new=data4*pc4;
data4_new=data4_new(:,1:count4);

data_new=[data1_new,data2_new,data3_new,data4_new];




