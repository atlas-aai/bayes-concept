
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Bayesian psychometrics for diagnostic assessments: A proof of concept

<!-- badges: start -->

[![DOI](https://img.shields.io/badge/DOI-10.35542%2Fosf.io%2Fjzqs8-brightgreen)](https://doi.org/10.35542/osf.io/jzqs8)
<!-- badges: end -->

This repository contains the source code for the Technical Report,
*Bayesian psychometrics diagnostic assessments: A proof of concept*. The
report is powered by [**bookdown**](https://bookdown.org), which makes
it easy to turn R markdown files into PDF.

The report can be found
[here](https://dynamiclearningmaps.org/sites/default/files/documents/publication/Bayes_Proof_Concept_2019.pdf).

This report was built with:

``` r
devtools::session_info(c("ratlas", "knitr", "english", "kableExtra", "tidyverse",
                         "rstan", "loo", "tidybayes",
                         "here", "glue", "fs"))
#> ─ Session info ───────────────────────────────────────────────────────────────
#>  setting  value                       
#>  version  R version 4.0.2 (2020-06-22)
#>  os       macOS Mojave 10.14.6        
#>  system   x86_64, darwin17.0          
#>  ui       X11                         
#>  language (EN)                        
#>  collate  en_US.UTF-8                 
#>  ctype    en_US.UTF-8                 
#>  tz       America/Chicago             
#>  date     2020-08-06                  
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────
#>  package        * version    date       lib source                            
#>  arrayhelpers     1.1-0      2020-02-04 [1] CRAN (R 4.0.0)                    
#>  askpass          1.1        2019-01-13 [1] CRAN (R 4.0.0)                    
#>  assertthat       0.2.1      2019-03-21 [1] CRAN (R 4.0.0)                    
#>  backports        1.1.8      2020-06-17 [1] CRAN (R 4.0.0)                    
#>  base64enc        0.1-3      2015-07-28 [1] CRAN (R 4.0.0)                    
#>  BH               1.72.0-3   2020-01-08 [1] CRAN (R 4.0.0)                    
#>  blob             1.2.1      2020-01-20 [1] CRAN (R 4.0.0)                    
#>  bookdown         0.20.2     2020-08-02 [1] Github (rstudio/bookdown@f9cf1ac) 
#>  broom            0.7.0      2020-07-09 [1] CRAN (R 4.0.2)                    
#>  callr            3.4.3      2020-03-28 [1] CRAN (R 4.0.0)                    
#>  cellranger       1.1.0      2016-07-27 [1] CRAN (R 4.0.0)                    
#>  checkmate        2.0.0      2020-02-06 [1] CRAN (R 4.0.0)                    
#>  cli              2.0.2      2020-02-28 [1] CRAN (R 4.0.0)                    
#>  clipr            0.7.0      2019-07-23 [1] CRAN (R 4.0.0)                    
#>  coda             0.19-3     2019-07-05 [1] CRAN (R 4.0.0)                    
#>  colorspace       1.4-1      2019-03-18 [1] CRAN (R 4.0.0)                    
#>  cpp11            0.1.0      2020-07-10 [1] CRAN (R 4.0.2)                    
#>  crayon           1.3.4      2017-09-16 [1] CRAN (R 4.0.0)                    
#>  curl             4.3        2019-12-02 [1] CRAN (R 4.0.0)                    
#>  DBI              1.1.0      2019-12-15 [1] CRAN (R 4.0.0)                    
#>  dbplyr           1.4.4      2020-05-27 [1] CRAN (R 4.0.0)                    
#>  desc             1.2.0      2018-05-01 [1] CRAN (R 4.0.0)                    
#>  digest           0.6.25     2020-02-23 [1] CRAN (R 4.0.0)                    
#>  distributional   0.1.0      2020-06-09 [1] CRAN (R 4.0.2)                    
#>  dplyr            1.0.1      2020-07-31 [1] CRAN (R 4.0.2)                    
#>  ellipsis         0.3.1      2020-05-15 [1] CRAN (R 4.0.0)                    
#>  english          1.2-5      2020-01-26 [1] CRAN (R 4.0.0)                    
#>  evaluate         0.14       2019-05-28 [1] CRAN (R 4.0.0)                    
#>  extrafont        0.17       2014-12-08 [1] CRAN (R 4.0.0)                    
#>  extrafontdb      1.0        2012-06-11 [1] CRAN (R 4.0.0)                    
#>  fansi            0.4.1      2020-01-08 [1] CRAN (R 4.0.0)                    
#>  farver           2.0.3      2020-01-16 [1] CRAN (R 4.0.0)                    
#>  forcats          0.5.0      2020-03-01 [1] CRAN (R 4.0.0)                    
#>  fs               1.5.0      2020-07-31 [1] CRAN (R 4.0.2)                    
#>  gdtools          0.2.2      2020-04-03 [1] CRAN (R 4.0.0)                    
#>  generics         0.0.2      2018-11-29 [1] CRAN (R 4.0.0)                    
#>  ggdist           2.2.0      2020-07-12 [1] CRAN (R 4.0.2)                    
#>  ggplot2          3.3.2      2020-06-19 [1] CRAN (R 4.0.0)                    
#>  glue             1.4.1      2020-05-13 [1] CRAN (R 4.0.0)                    
#>  gridExtra        2.3        2017-09-09 [1] CRAN (R 4.0.0)                    
#>  gtable           0.3.0      2019-03-25 [1] CRAN (R 4.0.0)                    
#>  haven            2.3.1      2020-06-01 [1] CRAN (R 4.0.0)                    
#>  HDInterval       0.2.2      2020-05-23 [1] CRAN (R 4.0.0)                    
#>  here             0.1        2017-05-28 [1] CRAN (R 4.0.0)                    
#>  highr            0.8        2019-03-20 [1] CRAN (R 4.0.0)                    
#>  hms              0.5.3      2020-01-08 [1] CRAN (R 4.0.0)                    
#>  hrbrthemes       0.8.0      2020-03-06 [1] CRAN (R 4.0.0)                    
#>  htmltools        0.5.0      2020-06-16 [1] CRAN (R 4.0.0)                    
#>  httpuv           1.5.4      2020-06-06 [1] CRAN (R 4.0.0)                    
#>  httr             1.4.2      2020-07-20 [1] CRAN (R 4.0.2)                    
#>  inline           0.3.15     2018-05-18 [1] CRAN (R 4.0.0)                    
#>  isoband          0.2.2      2020-06-20 [1] CRAN (R 4.0.0)                    
#>  jsonlite         1.7.0      2020-06-25 [1] CRAN (R 4.0.0)                    
#>  kableExtra       1.1.0      2019-03-16 [1] CRAN (R 4.0.0)                    
#>  knitr            1.29       2020-06-23 [1] CRAN (R 4.0.0)                    
#>  labeling         0.3        2014-08-23 [1] CRAN (R 4.0.0)                    
#>  later            1.1.0.1    2020-06-05 [1] CRAN (R 4.0.0)                    
#>  lattice          0.20-41    2020-04-02 [1] CRAN (R 4.0.2)                    
#>  lifecycle        0.2.0      2020-03-06 [1] CRAN (R 4.0.0)                    
#>  loo              2.3.1      2020-07-14 [1] CRAN (R 4.0.2)                    
#>  lubridate        1.7.9      2020-06-08 [1] CRAN (R 4.0.0)                    
#>  magrittr         1.5        2014-11-22 [1] CRAN (R 4.0.0)                    
#>  markdown         1.1        2019-08-07 [1] CRAN (R 4.0.0)                    
#>  MASS             7.3-51.6   2020-04-26 [1] CRAN (R 4.0.2)                    
#>  Matrix           1.2-18     2019-11-27 [1] CRAN (R 4.0.2)                    
#>  matrixStats      0.56.0     2020-03-13 [1] CRAN (R 4.0.0)                    
#>  mgcv             1.8-31     2019-11-09 [1] CRAN (R 4.0.2)                    
#>  mime             0.9        2020-02-04 [1] CRAN (R 4.0.0)                    
#>  modelr           0.1.8      2020-05-19 [1] CRAN (R 4.0.0)                    
#>  munsell          0.5.0      2018-06-12 [1] CRAN (R 4.0.0)                    
#>  nlme             3.1-148    2020-05-24 [1] CRAN (R 4.0.2)                    
#>  numDeriv         2016.8-1.1 2019-06-06 [1] CRAN (R 4.0.0)                    
#>  openssl          1.4.2      2020-06-27 [1] CRAN (R 4.0.1)                    
#>  pillar           1.4.6      2020-07-10 [1] CRAN (R 4.0.2)                    
#>  pkgbuild         1.1.0      2020-07-13 [1] CRAN (R 4.0.2)                    
#>  pkgconfig        2.0.3      2019-09-22 [1] CRAN (R 4.0.0)                    
#>  pkgload          1.1.0      2020-05-29 [1] CRAN (R 4.0.0)                    
#>  plyr             1.8.6      2020-03-03 [1] CRAN (R 4.0.0)                    
#>  praise           1.0.0      2015-08-11 [1] CRAN (R 4.0.0)                    
#>  prettyunits      1.1.1      2020-01-24 [1] CRAN (R 4.0.0)                    
#>  processx         3.4.3      2020-07-05 [1] CRAN (R 4.0.2)                    
#>  progress         1.2.2      2019-05-16 [1] CRAN (R 4.0.0)                    
#>  promises         1.1.1      2020-06-09 [1] CRAN (R 4.0.0)                    
#>  ps               1.3.3      2020-05-08 [1] CRAN (R 4.0.0)                    
#>  purrr            0.3.4      2020-04-17 [1] CRAN (R 4.0.0)                    
#>  R6               2.4.1      2019-11-12 [1] CRAN (R 4.0.0)                    
#>  ratlas           0.0.0.9000 2020-08-02 [1] Github (atlas-aai/ratlas@746bf9c) 
#>  RColorBrewer     1.1-2      2014-12-07 [1] CRAN (R 4.0.0)                    
#>  Rcpp             1.0.5      2020-07-06 [1] CRAN (R 4.0.2)                    
#>  RcppEigen        0.3.3.7.0  2019-11-16 [1] CRAN (R 4.0.0)                    
#>  RcppParallel     5.0.2      2020-06-24 [1] CRAN (R 4.0.0)                    
#>  readr            1.3.1      2018-12-21 [1] CRAN (R 4.0.0)                    
#>  readxl           1.3.1      2019-03-13 [1] CRAN (R 4.0.0)                    
#>  rematch          1.0.1      2016-04-21 [1] CRAN (R 4.0.0)                    
#>  reprex           0.3.0      2019-05-16 [1] CRAN (R 4.0.0)                    
#>  rlang            0.4.7      2020-07-09 [1] CRAN (R 4.0.2)                    
#>  rmarkdown        2.3.3      2020-08-02 [1] Github (rstudio/rmarkdown@204aa41)
#>  rprojroot        1.3-2      2018-01-03 [1] CRAN (R 4.0.0)                    
#>  rstan            2.21.1     2020-07-08 [1] CRAN (R 4.0.2)                    
#>  rstudioapi       0.11       2020-02-07 [1] CRAN (R 4.0.0)                    
#>  Rttf2pt1         1.3.8      2020-01-10 [1] CRAN (R 4.0.0)                    
#>  rvest            0.3.5      2019-11-08 [1] CRAN (R 4.0.0)                    
#>  scales           1.1.1      2020-05-11 [1] CRAN (R 4.0.0)                    
#>  selectr          0.4-2      2019-11-20 [1] CRAN (R 4.0.0)                    
#>  servr            0.18       2020-07-28 [1] CRAN (R 4.0.2)                    
#>  StanHeaders      2.21.0-5   2020-06-09 [1] CRAN (R 4.0.0)                    
#>  stringi          1.4.6      2020-02-17 [1] CRAN (R 4.0.0)                    
#>  stringr          1.4.0      2019-02-10 [1] CRAN (R 4.0.0)                    
#>  svUnit           1.0.3      2020-04-20 [1] CRAN (R 4.0.0)                    
#>  sys              3.3        2019-08-21 [1] CRAN (R 4.0.0)                    
#>  systemfonts      0.2.3      2020-06-09 [1] CRAN (R 4.0.0)                    
#>  testthat         2.3.2      2020-03-02 [1] CRAN (R 4.0.0)                    
#>  tibble           3.0.3      2020-07-10 [1] CRAN (R 4.0.2)                    
#>  tidybayes        2.1.1      2020-06-19 [1] CRAN (R 4.0.0)                    
#>  tidyr            1.1.1      2020-07-31 [1] CRAN (R 4.0.2)                    
#>  tidyselect       1.1.0      2020-05-11 [1] CRAN (R 4.0.0)                    
#>  tidyverse        1.3.0      2019-11-21 [1] CRAN (R 4.0.0)                    
#>  tinytex          0.25       2020-07-24 [1] CRAN (R 4.0.2)                    
#>  utf8             1.1.4      2018-05-24 [1] CRAN (R 4.0.0)                    
#>  V8               3.2.0      2020-06-19 [1] CRAN (R 4.0.0)                    
#>  vctrs            0.3.2      2020-07-15 [1] CRAN (R 4.0.2)                    
#>  viridisLite      0.3.0      2018-02-01 [1] CRAN (R 4.0.0)                    
#>  webshot          0.5.2      2019-11-22 [1] CRAN (R 4.0.0)                    
#>  whisker          0.4        2019-08-28 [1] CRAN (R 4.0.0)                    
#>  withr            2.2.0      2020-04-20 [1] CRAN (R 4.0.0)                    
#>  xaringan         0.16       2020-03-31 [1] CRAN (R 4.0.0)                    
#>  xfun             0.16       2020-07-24 [1] CRAN (R 4.0.2)                    
#>  xml2             1.3.2      2020-04-23 [1] CRAN (R 4.0.0)                    
#>  yaml             2.2.1      2020-02-01 [1] CRAN (R 4.0.0)                    
#> 
#> [1] /Library/Frameworks/R.framework/Versions/4.0/Resources/library
```
