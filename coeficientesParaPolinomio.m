function fun=coeficientesParaPolinomio(coef, raiz)
  fun = @(x) coef(1) + coef(2) * (x-raiz) + coef(3) * (x-raiz) .^2 + coef(4) * (x-raiz) .^4 ;
 endfunction