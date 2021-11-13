global Xtr Ytr xtest ytest

k=1;
for g=-15:1:3
    for c=-5:1:15
        resultg(k,1)=g;
        resultg(k,2)=c;
        x=[ 2^g , 2^c, 0.01];
        resultg(k,3)=cost_function( x);
        k=k+1;
    end
end
