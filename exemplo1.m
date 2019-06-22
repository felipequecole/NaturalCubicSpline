function exemplo1()
  format short
  % Exemplo 1
  x = [0,1,2,3];
  fx = [1, exp(1), exp(2), exp(3)];
  
  spM = SplineCubicaNaturalMat(x, fx);
  sp = SplineCubicaNatural(x, fx);
  disp('Coeficientes da Spline Cubica:');
%  disp(sp);
  disp(spM);
  
  % Prepara grafico 
  intervalos = [0:0.1:1; 1:0.1:2; 2:0.1:3];
  px1 = coeficientesParaPolinomio(sp(1,:), 0);
  px2 = coeficientesParaPolinomio(sp(2,:), 1);
  px3 = coeficientesParaPolinomio(sp(3,:), 2);
  data = [px1(intervalos(1, :)), px2(intervalos(2, 2:11)), px3(intervalos(3, 2:11))];
  x_axis = 0:0.1:3;
  plot(x_axis, data, "linewidth", 2, "color", "b"); 
  hold on; 
  plot(x_axis, @exp(x_axis), "linewidth", 1.5, "color", "r"); 
  for i=1:4
    plot(x(i), fx(i), "color", "k", "linewidth", 2, "markersize", 20);
    hold on; 
  endfor
  h = legend ({"Spline Cúbica Natural"}, "e^x (função aproximada)");
  legend (h, "location", "northwest");
  set (h, "fontsize", 15);
  axis([0,3, 0, 25]);
endfunction