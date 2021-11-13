global Xtr Ytr xtest ytest

k=1;
for g=-8:0.25:-6
    for c=0:0.25:2
        resultf(k,1)=g;
        resultf(k,2)=c;
        x=[ 2^g , 2^c, 0.01];
        resultf(k,3)=cost_function( x);
        k=k+1;
    end
end
