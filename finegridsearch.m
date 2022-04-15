function Solution = finegridsearch(xtr,ytr, xtest, ytest,GS_solution)

global xtr ytr xtest ytest

k=1;
for g=GS_solution(1,1)-1:0.25:GS_solution(1,1)+1
    for c=GS_solution(1,1)-1:0.25:GS_solution(1,1)+1
        resultf(k,1)=g;
        resultf(k,2)=c;
        x=[ 2^g , 2^c, 0.01];
        resultf(k,3)=cost_function( x);
        k=k+1;
    end
end
[C,I]=max(resultf(:,3));
Solution=resultf(I,1:2);
