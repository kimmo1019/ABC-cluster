global data_new
global FoodNumber
% the parameters
D = size(data_new,2);%the dimension of the problem
maxCycle = 200; 
runtime = 1;
alpha = 0.8;
pops = 0;

NP = 40;%the total number of the bees
FoodNumber=15; 

trial=zeros(1,FoodNumber);

for r=1:runtime
tic
ub = max(data_new);
lb = min(data_new);
Range = repmat((ub-lb),[NP 1]);
Lower = repmat(lb, [NP 1]);
Foods = rand(NP,D) .* Range + Lower;%initial the positon randomly

%initial phase
Fitness=liuqiao(Foods);
[sort_Fitness,sort_index]=sort(Fitness,'descend');
Foods=Foods(sort_index,:);
Fitness=Fitness(:,sort_index);%sort 
[Fitness,CN,cluster_index,CH]=liuqiao(Foods(1:FoodNumber,:));
CH_record=[];
%initial phase ends

trial = ones(1,FoodNumber);%initial the trial


iter=1;
while ((iter < maxCycle)),
    sequenca = randperm(D);
    for i=1:(FoodNumber)
     sequenca = randperm(D);
     list = sequenca(1,1:trial(i));
     sol = Foods(i,:);
    for j = 1:trial(i)
     kiko = list(1,j);
     neighbour1 = fix(rand*(FoodNumber)) + 1;
     neighbour2 = fix(rand*(FoodNumber)) + 1;
        while(neighbour2 == i)
              neighbour2 = fix(rand*(FoodNumber)) + 1;
         end;
     vv = trial(i)./(trial(i) + trial(neighbour2));
     sol(kiko) = Foods(neighbour1,kiko) + (Foods(i,kiko) - Foods(neighbour2,kiko)).*(2.*rand-1).*vv;
    end
%if generated parameter value is out of boundaries, it is shifted onto the boundaries
       ind=find(sol<lb);
        sol(ind)=lb(ind);
        ind=find(sol>ub);
        sol(ind)=ub(ind);

%evaluate new solution
         
         new_Foods=Foods(1:FoodNumber,:);
         new_Foods(i,:)=sol;
         [new_Fitness,new_CN,new_cluster_index,new_CH]=liuqiao(new_Foods);
         FitnessSol=new_Fitness(i);
%a greedy selection is applied between the current solution i and its mutant
          if (new_CH>CH) %If the mutant solution is better than the current solution i,
              %replace the solution with the mutant and reset the trial counter of solution i
               Foods(i,:)=sol;
              [Fitness,CN,cluster_index,CH]=liuqiao(new_Foods);
               trial(i) = 1;
          end;   
    end;
%the employed phase ends

    prob = Fitness./sum(Fitness);
    i=1;
    t=0;
    for t = 1:NP-FoodNumber
        if(rand < prob(i))
%The parameter to be changed is determined randomly
           Param2Change = fix(rand*D)+1;
           neighbour = fix(rand*(FoodNumber))+1;      
           while(neighbour==i)
              neighbour=fix(rand*(FoodNumber))+1;
           end;
           sol=Foods(i,:);
           vv = trial(i)./(trial(i) + trial(neighbour));
           sol(Param2Change)=Foods(i,Param2Change)+(Foods(i,Param2Change)-Foods(neighbour,Param2Change))*(rand-0.5)*2.*vv;
%if generated parameter value is out of boundaries, it is shifted onto the boundaries
           ind=find(sol<lb);
           sol(ind)=lb(ind);
           ind=find(sol>ub);
           sol(ind)=ub(ind);

%evaluate new solution
         new_Foods=Foods(1:FoodNumber,:);
         new_Foods(i,:)=sol;
         [new_Fitness,new_CN,new_cluster_index,new_CH]=liuqiao(new_Foods);
         FitnessSol=new_Fitness(i);

%a greedy selection is applied between the current solution i and its mutant
           if (new_CH>CH) %If the mutant solution is better than the current solution i, 
               %replace the solution with the mutant and reset the trial counter of solution i
                Foods(i,:)=sol;
              [Fitness,CN,cluster_index,CH]=liuqiao(new_Foods);
               trial(i) = 1;
           else
                trial(i) = trial(i) + 1; %if the solution i can not be improved, increase its trial counter
           end;
        end;
%onlooker bee phase ends
        i=i+1;
        if (i==(FoodNumber)+1) 
            i=1;
        end;  
    end;
%the reset phase    
    ind = find(trial > D);
    trial(ind) = D;
    if (mean(trial) > (D*alpha))
                pops = pops + 1;%to count the times of real reset
                sequencx = randperm(NP);
                num = fix(NP*alpha) + 1;
                list3 = sequencx(1:num);
                for ii = 1:num 
                    sol = (ub-lb).*rand(1,D) + lb;
                    Foods(list3(ii),:) = sol;
                   
                end
               
    end;            
 [Fitness,CN,cluster_index,CH]=liuqiao(Foods(1:FoodNumber,:));

    iter=iter+1;
CH_record=[CH_record,CH];
fprintf('Cycle=%d CH index=%g\n',iter,CH);
    end % End of ABC
    timer(r) = toc;% to store the time for every run
    
end%end of run

%plot 
plot(CH_record);
xlabel('Iteration');
ylabel('CH_index');