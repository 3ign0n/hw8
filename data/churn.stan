data {
  int N; // sample size
  int M; // variable num
  int t[N]; 
  int y[N];
  matrix[N,M] x;
}
parameters {
  vector[M] beta;
}
transformed parameters {
  vector[N] theta;
  for(n in 1:N)
    theta[n] = inv_logit(x[n]*beta);
}
model {
  y ~ binomial(t, theta);
}

