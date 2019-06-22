function exemplo2()
  format short
  % Exemplo 2
  x = [1, 2, 3];
  fx = [2, 3, 5];
  sp = SplineCubicaNaturalMat(x, fx);
  disp('Coeficientes da Spline Cubica:');
  printf('\tA\tB\tC\tD\t\n');
  disp(sp);
  
  % Prepara grafico 
  intervalos = [1:0.1:2; 2:0.1:3];
  px1 = coeficientesParaPolinomio(sp(1,:), 1);
  px2 = coeficientesParaPolinomio(sp(2,:), 2);

  data = [px1(intervalos(1, :)), px2(intervalos(2, 2:11))];
  x_axis = 1:0.1:3;
   
  plot(x_axis, data, "linewidth", 2, "color", "b"); 
  hold on; 
  for i=1:3
    plot(x(i), fx(i), "color", "r", "linewidth", 2, "markersize", 25);
    hold on; 
  endfor
  h = legend ({"Spline Cúbica Natural"});
  legend (h, "location", "northwest");
  set (h, "fontsize", 15);

  axis([0,4,0,6]);

endfunction