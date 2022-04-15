function [GBP  BestCost] = sensitivityanalisis(Xtr,Ytr, xtest, ytest, L,U,nPop,w,c1,c2,wdamp,MaxIt)
global Xtr Ytr xtest ytest, L, U

%% Problem Statement
clock
TotalNum = 2;


NPar = TotalNum;
VarSize=[1,NPar];


VarMin = L;
VarMax =U;

CostFuncName = 'cost_function';

%% Problems of PSO
%MaxIt=80;          %Maximum Number of iteration
%nPop=20;          %population size  (Sworm size)
%w=0.25;         %Inertia Coefficient  0.7298
%wdamp=0.9;      %damping ratio of inertia coefficient
%c1=2 ;         % Personal Acceleration coefficient  1.4962 
%c2=2;           % Social Acceleration coefficient
%Initialization

% the particle Templet
empty_particle.Position=[];
empty_particle.Velocity=[];
empty_particle.Cost=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];
%Create Population Array
particle=repmat(empty_particle,nPop,1);


%Initialize globale best
%GlobalBest.Position=[];
GlobalBest.Cost=inf;  %for maximizasion (-inf)
GlobalBest.Position = []; %%%%%%%
GlobalBest.CostMAT = []; %%%%%%%%%%%%

%Initialize Population Members
for i=1:nPop
    
    %Generate random solution
  particle(i).Position=unifrnd(VarMin,VarMax, VarSize);
    %Initialize Velocity
    particle(i).Velocity=zeros(VarSize);
    
   % Evaluation
      %%%%%particle(i).Cost=CostFuncName(particle(i).Position);
          particle(i).Cost = cost_function (particle(i).Position);%feval(CostFuncName,particle(i).Position,Xtr,Ytr,Network);             %%%%%%%%%%%%%%

   %Update the personal best
      particle(i).Best.Position=particle(i).Position;
      particle(i).Best.Cost=particle(i).Cost;

     %Update the global best
   
   if particle(i).Best.Cost<GlobalBest.Cost
       %GlobalBest=particle(i).Best;%%%
       GlobalBest.Cost = particle(i).Best.Cost;
       GlobalBest.Position = particle(i).Best.Position;
       
       %GlobalBest.Cost=Particle(i).Best.Cost;
   end
   
end
% Array to hold best cost value on each iteration
BestCost=zeros(MaxIt,1)


%% Main Loop
for it=1:MaxIt
   for i=1:nPop
       
       %update velocity
      particle(i).Velocity=w*particle(i).Velocity...
                            +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position)...
                            +c2*rand(VarSize).*(GlobalBest.Position-particle(i).Position);
        %update position               
      particle(i).Position=particle(i).Position+particle(i).Velocity;
      %evaluation
      
      particle(i).Position = max(particle(i).Position , VarMin);
      particle(i).Position = min(particle(i).Position , VarMax);
            %%%%%particle(i).Cost=CostFuncName(particle(i).Position);
                particle(i).Cost = cost_function (particle(i).Position);%feval(CostFuncName,particle(i).Position,Xtr,Ytr,Network);             %%%%%%%%%%%%%


 
      %update personal best
      if particle(i).Cost<particle(i).Best.Cost
          particle(i).Best.Position=particle(i).Position;
          particle(i).Best.Cost=particle(i).Cost;
          %update global best
      if particle(i).Best.Cost<GlobalBest.Cost
          %GlobalBest=particle(i).Best;
                GlobalBest.Cost = particle(i).Best.Cost;   %%%%%%%%%%%%
            GlobalBest.Position = particle(i).Best.Position;%%%%%%%%%%
   
      end
      end
       
   end
   %store the best cost value
% BestCost(it)=GlobalBest.Cost;
 %display iteration information
 %disp(['Iteration: ' num2str(it) ' BestCost: ' num2str(BestCost(it))]) 
     %damping intertia coefficient

 %% Display
 %   disp(['Itretion = ' num2str(it) '; Best Cost = ' num2str(GlobalBest.Cost) ';'])
    GlobalBest.CostMAT = [GlobalBest.CostMAT GlobalBest.Cost];
        w=w*wdamp;

end

GBP=GlobalBest.Position
plot(GlobalBest.CostMAT)
tt=GlobalBest.CostMAT;
BestCost = GlobalBest.Cost;

end
