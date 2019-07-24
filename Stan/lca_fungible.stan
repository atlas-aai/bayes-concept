data {
  int<lower=1> I;                                     // number of items
  int<lower=1> J;                                     // number of respondents
  int<lower=1> N;                                     // number of observations
  int<lower=1,upper=I> ii[N];                         // item for obs n
  int<lower=1,upper=J> jj[N];                         // respondent for obs n
  int<lower=0,upper=1> y[N];                          // score for obs n
  int<lower=1,upper=N> s[J];                          // row of start for j
  int<lower=1,upper=I> l[J];                          // number of items for j
}
parameters {
  simplex[2] nu;

  // average intercept and main effect
  real mean_intercept;
  real<lower=0> mean_maineffect;
}
transformed parameters {
  vector[2] log_nu = log(nu);

  real intercept[I];
  real maineffect[I];
  vector[I] master_pi;
  vector[I] nonmaster_pi;
  matrix[I,2] pi;

  for (i in 1:I) {
    intercept[i] = mean_intercept;
    maineffect[i] = mean_maineffect;

    nonmaster_pi[i] = inv_logit(intercept[i]);
    master_pi[i] = inv_logit(intercept[i] + maineffect[i]);
  }

  // Probability of correct response for each class on each item
  // class 1 = nonmaster; class 2 = master
  for (c in 1:2) {
    for (i in 1:I) {
      pi[i,c] = master_pi[i]^(c - 1) * nonmaster_pi[i]^(1 - (c - 1));
    }
  }
}
model{
  real ps[2];

  // Priors
  mean_intercept ~ normal(0, 2);
  mean_maineffect ~ lognormal(0, 1);

  // Define model
  for (j in 1:J) {
    for (c in 1:2) {
      real log_items[l[j]];
      for (m in 1:l[j]) {
        int i = ii[s[j] + m - 1];
        log_items[m] = y[s[j] + m - 1] * log(pi[i,c]) + (1 - y[s[j] + m - 1]) * log(1 - pi[i,c]);
      }
      ps[c] = log_nu[c] + sum(log_items);
    }
    target += log_sum_exp(ps);
  }
}
generated quantities {
  vector[J] log_lik;

  // Generate log-likelihood
  for (j in 1:J) {
    real ps[2];
    for (c in 1:2) {
      real log_items[l[j]];
      for (m in 1:l[j]) {
        int i = ii[s[j] + m - 1];
        log_items[m] = y[s[j] + m - 1] * log(pi[i,c]) + (1 - y[s[j] + m -  1]) * log(1 - pi[i,c]);
      }
      ps[c] = log_nu[c] + sum(log_items);
    }
    log_lik[j] = log_sum_exp(ps);
  }
}
