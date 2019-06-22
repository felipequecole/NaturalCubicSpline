function sp=SplineCubicaNatural(x,an)
  n = length(x);
  h = b = c = d = [];
  % step 1
  for i = 1:n-1
    h(i) = x(i+1) - x(i);
  endfor
  % step 2
  alpha = [];
  for i = 2:n-1
    alpha(i) = ((3/h(i))*(an(i+1)-an(i)))-(3/h(i-1))*(an(i)-an(i-1));
  endfor
  % step 3
  ln = [1];
  un = [0];
  zn = [0];
  % step 4
  for i = 2:n-1
    ln(i) = 2*(x(i+1)-x(i-1))-h(i-1)*un(i-1);
    un(i) = h(i)/ln(i);
    zn(i) = (alpha(i)-h(i-1)*zn(i-1))/ln(i);
  endfor
  % step 5
  ln(n) = 1;
  zn(n) = 0;
  c(n) = 0;
  % step 6
  for j=n-1:-1:1
    c(j) = zn(j)-un(j)*c(j+1);
    b(j) = (an(j+1)-an(j))/h(j) - (h(j)*(c(j+1)+2*c(j)))/3;
    d(j) = (c(j+1)-c(j))/(3*h(j));
  endfor
  sp = zeros(4,n-1);
  sp(1,:) = an(1:n-1);
  sp(2,:) = b(1:n-1);
  sp(3,:) = c(1:n-1);
  sp(4,:) = d(1:n-1);
  sp = sp';
endfunction