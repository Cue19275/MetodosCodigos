% A=[4 -1 -1;-2 6 1; -1 1 7];
% b=[3 9 -6]';
% x=[0 0 0]';

% Matriz Ej1
% A=[-1 0 0 sqrt(2)/2 1 0 0 0; ...
%     0 -1 0 sqrt(2)/2 0 0 0 0; ...
%     0 0 -1 0 0 0 0.5 0; ...
%     0 0 0 -sqrt(2)/2 0 -1 -0.5 0; ...
%     0 0 0 0 -1 0 0 1; ...
%     0 0 0 0 0 1 0 0; ...
%     0 0 0 -sqrt(2)/2 0 0 sqrt(3)/2 0; ...
%     0 0 0 0 0 0 -sqrt(3)/2 -1]
% b=[0 0 0 0 0 10000 0 0]';
% x=zeros(1,8)'

%Mat 1 Ej2
% A = [4 1 1 0 1;
%     -1 -3 1 1 0;
%      2 1 5 -1 -1;
%      -1 -1 -1 4 0;
%      0 2 -1 1 4];
% b = [6 6 6 6 6]';
% x=zeros(1,5)';

%Mat2 Ej2
% A=[4 1 -1 1;
%     1 4 -1 -1;
%     -1 -1 5 1;
%     1 -1 1 3];
% b=[-2 -1 0 1]';
% x=zeros(1,4)';

%Mat3 Ej2
% A = [4 -1 0 0 0 0;
%     -1 4 -1 0 0 0;
%      0 -1 4 0 0 0;
%      0 0 0 4 -1 0;
%      0 0 0 -1 4 -1;
%      0 0 0 0 -1 4];
% b = [0 5 0 6 -2 6]';
% x=zeros(1,6)';

%Mat Proj 1
% A=[
%  400 -300 0 0 0
%  -300 730 -330 0 0
%  0 -330 2630 -100 -2200
%  0 0 -100 350 0
%  0 0 -2200 0 3200];
% b=[-10 0 0 0 6]';
% x=zeros(1,5)'

%Mat Proj 2
A=[17 56.5 606.85
   56.5 606.85 9570
   606.85 9570 173381.5];
b=[12.87 44.1 400.6]';
x=zeros(1,3)';
w= 1.1;
D=diag(diag(A));
L=tril(A,-1);
U=triu(A,1);
n=size(x,1);
norma=Inf; 
tol=0.001; itr=0;
itr=0;
%fprintf('   x1   |   x2   |   x3   |   x4   |   x5   |   x6   |   x7   |   x8   \n')
%  fprintf('   x1   |   x2    |   x3    |   x4    |   x5   \n')
% fprintf('   x1   |   x2    |   x3    |   x4    \n')
fprintf('   x1   |   x2   |   x3   |   x4   |   x5   |   x6   \n')
while norma>tol
x_ant=x;
x=inv(D + w*L)*(w*b-(w*U+(w-1)*D)*x);
g4=sprintf('%f ', x);
fprintf('%s\n', g4)
itr=itr+1;
norma=norm(x-x_ant, inf);
end
fprintf('\nResultados\n')
%fprintf('    x1    |     x2     |     x3     |     x4     |     x5     |     x6     |     x7     |     x8     \n%s\n', g4)
%fprintf('    I1    |   I2    |    I3   |   I4    |   I5   |\n%s\n', g4)
%  fprintf('   x1   |   x2    |   x3    |   x4    |   x5   \n%s\n', g4)
 fprintf('   c   |   b    |   a    |\n%s\n', g4)
fprintf('En %d iteraciones\n',itr);