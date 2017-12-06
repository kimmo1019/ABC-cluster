subplot(2,2,1);
bar(10*eig1(1:count1));
hold on
for i=1:count1
    prop1(i)=100*sum(eig1(1:i))/sum(eig1);
end
plot(1:count1,prop1,'r');
xlabel('Principal Component');
ylabel('Variance Explained(%)');
title('CNV');
hold off
subplot(2,2,2);
bar(4*eig2(1:count2));
hold on
for i=1:count2
    prop2(i)=100*sum(eig2(1:i))/sum(eig2);
end
plot(1:count2,prop2,'r');
xlabel('Principal Component');
ylabel('Variance Explained(%)');
title('RPPA');
hold off
subplot(2,2,3);
bar(6.5*eig3(1:count3));
hold on
for i=1:count3
    prop3(i)=100*sum(eig3(1:i))/sum(eig3);
end
plot(1:count3,prop3,'r');
xlabel('Principal Component');
ylabel('Variance Explained(%)');
title('mRNA');
hold off
subplot(2,2,4);
bar(25*eig4(1:count4));
hold on
for i=1:count4
    prop4(i)=100*sum(eig4(1:i))/sum(eig4);
end
plot(1:count4,prop4,'r');
xlabel('Principal Component');
ylabel('Variance Explained(%)');
title('miRNA');
hold off
    