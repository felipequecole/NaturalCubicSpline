function sp=SplineCubicaNaturalMat(x,an)
  n = length(x);
  h = b = c = d = [];
  % Calculo dos h(i)
  for i = 1:n-1
    h(i) = x(i+1) - x(i);
  endfor
  % Criação da Matriz A
  A = zeros(n, n);
  A(1,1) = 1;
  A(n, n) = 1;
  for j = 1:n-2
    A(j+1,j)=h(j);
    A(j+1,j+1)=2*(h(j)+h(j+1));
    A(j+1,j+2)=h(j+1);
  endfor
  disp(A);
  % Criação de b
  b = [];
  b(1) = 0;
  b(n) = 0;
  alpha = [];
  for i = 2:n-1
    alpha(i)= b(i) = ((3/h(i))*(an(i+1)-an(i)))-(3/h(i-1))*(an(i)-an(i-1));
  endfor
  disp('b = ');
  disp(b);  
  % Resolver o sistema linear resulta nos c(i)  
  c = A \ b';
  disp('c = ');
  disp(c(1:n-1)); 
  
  % Calculo dos b(i) e d(i)
  b = d = [];
  for i=1:n-1
    b(i) = (1/h(i))*(an(i+1)-an(i)) - (h(i)/3)*(c(i+1) + 2*c(i));
    d(i) = (1/(3*h(i)))*(c(i+1)-c(i));
  endfor
  
  sp = zeros(4,n-1);
  sp(1,:) = an(1:n-1);
  sp(2,:) = b(1:n-1);
  sp(3,:) = c(1:n-1);
  sp(4,:) = d(1:n-1);
  sp = sp';
endfunction