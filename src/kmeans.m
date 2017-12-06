k=3;
a=[0,0,0,0,0,0,0,0];
b=[1,1,1,1,1,1,1,1];
test2=[2,2,2];
cl={a,a,a};
center={a,a,a};
t={b,b,b};
distant=center;

count=1;

for i=1:k
    center{i}=q(randi([1,1484]),:);
end

while  (1)
   
%   for i=1:k
%    c=(t{i}==center{i});
%    c=double(c);
%    test2(i)=c*c';
%   end
%   test=test2*test2';
%   if(test==8)
%       break;
%   end
for i=1:k
        testdis=t{i}-center{i};
        dist=testdis(1)^2+testdis(2)^2+testdis(3)^2+testdis(4)^2+testdis(5)^2+testdis(6)^2+testdis(7)^2+testdis(8)^2;
        dist=sqrt(dist);
        if dist<0.00000001
            test2(i)=1;
        else
            test2(i)=0;
        end        
end
test=test2*test2';
    if(test==k)
         break;
    end


  if(count==2)
       center=t;
  end
  cl={a,a,a,a,a,a,a,a};
for i=1:1484
      d1=100; 
    for m=1:k
        distant{m}=q(i,:)-center{m};
        dist=distant{m}(1)^2+distant{m}(2)^2+distant{m}(3)^2+distant{m}(4)^2+distant{m}(5)^2+distant{m}(6)^2+distant{m}(7)^2+distant{m}(8)^2;
        dist=sqrt(dist);
        if(dist<d1)
            n=m;
            d1=dist;
        end
    end
    cl{n}=[cl{n};q(i,:)];
end
for i=1:k
    t{i}=mean(cl{i});
end
    count=2;
end

