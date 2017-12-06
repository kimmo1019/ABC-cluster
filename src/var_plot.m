clc;
close all;
clear all;
load data.mat
threshod=0.005;

for i=1:size(data1,2)
    var1(i)=var(data1(:,i));
end
for i=1:size(data2,2)
    var2(i)=var(data2(:,i));
end
for i=1:size(data3,2)
    var3(i)=var(data3(:,i));
end
for i=1:size(data4,2)
    var4(i)=var(data4(:,i));
end
subplot(2,2,1);
plot(var1);
xlabel('Feature');
ylabel('Variance');
title('CNV');
hold on;
line1=ones(1,size(var1,2))*max(var1)*threshod;
plot(line1,'r');
subplot(2,2,2);
plot(var2);
xlabel('Feature');
ylabel('Variance');
title('RPPA');
hold on;
line2=ones(1,size(var2,2))*max(var2)*threshod;
plot(line2,'r');
subplot(2,2,3);
plot(var3);
xlabel('Feature');
ylabel('Variance');
hold on;
line3=ones(1,size(var3,2))*max(var3)*threshod;
ind3=find(var3>threshod*max(var3));
new_var3=var3(ind3);
num3=size(new_var3,2);
plot(line3,'r');
title('mRNA');
subplot(2,2,4);
plot(var4);
xlabel('Feature');
ylabel('Variance');
hold on;
line4=ones(1,size(var4,2))*max(var4)*threshod;
ind4=find(var4>threshod*max(var4));
new_var4=var4(ind4);
num4=size(new_var4,2);
plot(line4,'r');
xlabel('Feature');
ylabel('Variance');
title('miRNA');
figure();
subplot(2,2,1);
plot(var1);
xlabel('Feature');
ylabel('Variance');
title('CNV');
subplot(2,2,2);
plot(var2);
xlabel('Feature');
ylabel('Variance');
title('RPPA');
subplot(2,2,3);
plot(new_var3);
xlabel('Feature');
ylabel('Variance');
title('mRNA');
subplot(2,2,4);
plot(new_var4);
xlabel('Feature');
ylabel('Variance');
title('miRNA');


 


