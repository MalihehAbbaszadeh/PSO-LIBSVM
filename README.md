**Introduction**

PSO-SVC and GRIDSERCH codes have been developed to calculate the model parameters by PSO-based and grid search methods, respectively. As the MATLAB environment is a high-level technical computing, it has been chosen in this research. Also, based on MATLAB's integration ability with other languages, LIBSVM library codes [1] has been compiled in Matlab for support vector machine calculations. 

**Usage of PSO-SVC code:**

matlab>> [GlobalBest.Position  BestCost] = TrainUsing_PSO_Fcn(xtr,ytr, xtest, ytest, L(1:2),U(1:2));

        - GlobalBest.Position: Optimum values of model parameters ( gama and C).
        - BestCost: Optimum classification accuracy. 
        -xtr: An m by n matrix of m training instances with n features. It can be dense or sparse (type must be double).
        -ytr: An m by 1 vector of training labels (type must be double).
        - xtest: An m by n matrix of m testing instances with n features. It can be dense or sparse. (type must be double)
        -Ytest: An m by 1 vector of prediction labels. If labels of test data are unknown, simply use any random values. (type must be double)
        - GlobalBest.Position: Optimum values of model parameters ( gama and C).
        - BestCost: Optimum classification accuracy. 

**Usage of Sensitivityanalisis code:**

Sensitivityanalisis: is developed for tunning the PSO parameters.

matlab>> [GBP  BestCost] = sensitivityanalisis(xtr,ytr, xtest, ytest, L,U,nPop,w,c1,c2,wdamp,MaxIt);
        - L: Lower bound of decision variables.
        - U: : Upper bound of decision variables.
        - nPop: population size  (Sworm size).
        - w: Inertia Coefficient.
        - c1: Personal Acceleration coefficient.
        - c2: Social Acceleration coefficient.
        - wdamp: damping ratio of inertia coefficient.
        - MaxIt: Maximum Number of iteration.

**Usage of Coarsegridsearch and finegridsearch codes**:

Coarsegridsearch and finegridsearch files are developed for model selection by grid search method.  

matlab>> GS_solution = coarsegridsearch(xtr,ytr, xtest, ytest);
matlab>> Solution = finegridsearch(xtr,ytr, xtest, ytest,GS_solution);

        - GS_solution: results of coarse grid algorithm for model parameters.
        - Solution: results of fine grid algorithm for model parameters

**Installation of LIBSVM**

Just type 'make' to build 'libsvmread.mex', 'libsvmwrite.mex', 'svmtrain.mex', and 'svmpredict.mex', as following:
matlab>>  make
If make.m does not work on MATLAB (especially for Windows), try 'mex-setup' to choose a suitable compiler for mex. Make sure your compiler is accessible and workable. Then type 'make' to do the installation. MATLAB will choose the default compiler. If you have multiple compliers, a list is given and you can choose one from the list [1].

References: 

[1] Chih-Chung Chang and Chih-Jen Lin, LIBSVM : a library for support vector machines. ACM Transactions on Intelligent Systems and Technology, 2:27:1--27:27, 2011. Software available at http://www.csie.ntu.edu.tw/~cjlin/libsvm


