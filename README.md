
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Bayesian psychometrics for diagnostic assessments: A proof of concept

This repository contains the source code for the Technical Report,
*Bayesian psychometrics diagnostic assessments: A proof of concept*. The
report is powered by [**bookdown**](https://bookdown.org), which makes
it easy to turn R markdown files into PDF.

The report can be found
[here](https://dynamiclearningmaps.org/sites/default/files/documents/publication/Bayes_Proof_Concept_2019.pdf).

This report was built
with:

``` r
devtools::session_info(c("ratlas", "knitr", "english", "kableExtra", "tidyverse",
                         "rstan", "loo", "tidybayes",
                         "here", "glue", "fs"))
#> ─ Session info ───────────────────────────────────────────────────────────────
#>  setting  value                       
#>  version  R version 3.6.1 (2019-07-05)
#>  os       macOS Mojave 10.14.6        
#>  system   x86_64, darwin15.6.0        
#>  ui       X11                         
#>  language (EN)                        
#>  collate  en_US.UTF-8                 
#>  ctype    en_US.UTF-8                 
#>  tz       America/Chicago             
#>  date     2019-11-18                  
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────
#>  package      * version      date       lib
#>  arrayhelpers   1.0-20160527 2016-05-28 [1]
#>  askpass        1.1          2019-01-13 [1]
#>  assertthat     0.2.1        2019-03-21 [1]
#>  backports      1.1.5        2019-10-02 [1]
#>  base64enc      0.1-3        2015-07-28 [1]
#>  BH             1.69.0-1     2019-01-07 [1]
#>  bookdown       0.15         2019-11-12 [1]
#>  broom          0.5.2        2019-04-07 [1]
#>  callr          3.3.2        2019-09-22 [1]
#>  cellranger     1.1.0        2016-07-27 [1]
#>  checkmate      1.9.4        2019-07-04 [1]
#>  cli            1.1.0        2019-03-19 [1]
#>  clipr          0.7.0        2019-07-23 [1]
#>  coda           0.19-3       2019-07-05 [1]
#>  colorspace     1.4-1        2019-03-18 [1]
#>  crayon         1.3.4        2017-09-16 [1]
#>  curl           4.2          2019-09-24 [1]
#>  DBI            1.0.0        2018-05-02 [1]
#>  dbplyr         1.4.2        2019-06-17 [1]
#>  desc           1.2.0        2018-05-01 [1]
#>  digest         0.6.22       2019-10-21 [1]
#>  dplyr          0.8.3        2019-07-04 [1]
#>  ellipsis       0.3.0        2019-09-20 [1]
#>  english        1.2-3        2019-03-23 [1]
#>  evaluate       0.14         2019-05-28 [1]
#>  extrafont      0.17         2014-12-08 [1]
#>  extrafontdb    1.0          2012-06-11 [1]
#>  fansi          0.4.0        2018-10-05 [1]
#>  forcats        0.4.0        2019-02-17 [1]
#>  fs             1.3.1        2019-05-06 [1]
#>  gdtools        0.2.1        2019-10-14 [1]
#>  generics       0.0.2        2018-11-29 [1]
#>  ggplot2        3.2.1.9000   2019-11-17 [1]
#>  glue           1.3.1        2019-03-12 [1]
#>  gridExtra      2.3          2017-09-09 [1]
#>  gtable         0.3.0        2019-03-25 [1]
#>  haven          2.2.0        2019-11-08 [1]
#>  HDInterval     0.2.0        2018-06-09 [1]
#>  here           0.1          2017-05-28 [1]
#>  highr          0.8          2019-03-20 [1]
#>  hms            0.5.2        2019-10-30 [1]
#>  hrbrthemes     0.7.2        2019-08-12 [1]
#>  htmltools      0.4.0        2019-10-04 [1]
#>  httr           1.4.1        2019-08-05 [1]
#>  hunspell       3.0          2018-12-15 [1]
#>  inline         0.3.15       2018-05-18 [1]
#>  isoband        0.2.0        2019-04-06 [1]
#>  jsonlite       1.6          2018-12-07 [1]
#>  kableExtra     1.1.0        2019-03-16 [1]
#>  knitr          1.26         2019-11-12 [1]
#>  labeling       0.3          2014-08-23 [1]
#>  lattice        0.20-38      2018-11-04 [2]
#>  lifecycle      0.1.0        2019-08-01 [1]
#>  loo            2.1.0        2019-03-13 [1]
#>  lubridate      1.7.4        2018-04-11 [1]
#>  magrittr       1.5          2014-11-22 [1]
#>  markdown       1.1          2019-08-07 [1]
#>  MASS           7.3-51.4     2019-03-31 [1]
#>  Matrix         1.2-17       2019-03-22 [2]
#>  matrixStats    0.55.0       2019-09-07 [1]
#>  mgcv           1.8-28       2019-03-21 [2]
#>  mime           0.7          2019-06-11 [1]
#>  modelr         0.1.5        2019-08-08 [1]
#>  munsell        0.5.0        2018-06-12 [1]
#>  nlme           3.1-140      2019-05-12 [2]
#>  openssl        1.4.1        2019-07-18 [1]
#>  pillar         1.4.2        2019-06-29 [1]
#>  pkgbuild       1.0.6        2019-10-09 [1]
#>  pkgconfig      2.0.3        2019-09-22 [1]
#>  pkgload        1.0.2        2018-10-29 [1]
#>  plogr          0.2.0        2018-03-25 [1]
#>  plyr           1.8.4        2016-06-08 [1]
#>  praise         1.0.0        2015-08-11 [1]
#>  prettyunits    1.0.2        2015-07-13 [1]
#>  processx       3.4.1        2019-07-18 [1]
#>  progress       1.2.2        2019-05-16 [1]
#>  ps             1.3.0        2018-12-21 [1]
#>  purrr          0.3.3        2019-10-18 [1]
#>  R6             2.4.1        2019-11-12 [1]
#>  ratlas         0.0.0.9000   2019-11-17 [1]
#>  RColorBrewer   1.1-2        2014-12-07 [1]
#>  Rcpp           1.0.3        2019-11-08 [1]
#>  RcppEigen      0.3.3.7.0    2019-11-16 [1]
#>  readr          1.3.1        2018-12-21 [1]
#>  readxl         1.3.1        2019-03-13 [1]
#>  rematch        1.0.1        2016-04-21 [1]
#>  reprex         0.3.0        2019-05-16 [1]
#>  reshape2       1.4.3        2017-12-11 [1]
#>  rlang          0.4.1.9000   2019-11-17 [1]
#>  rmarkdown      1.17         2019-11-13 [1]
#>  rprojroot      1.3-2        2018-01-03 [1]
#>  rstan          2.19.2       2019-07-09 [1]
#>  rstudioapi     0.10         2019-03-19 [1]
#>  Rttf2pt1       1.3.7        2018-06-29 [1]
#>  rvest          0.3.5        2019-11-08 [1]
#>  scales         1.0.0        2018-08-09 [1]
#>  selectr        0.4-1        2018-04-06 [1]
#>  StanHeaders    2.19.0       2019-09-07 [1]
#>  stringi        1.4.3        2019-03-12 [1]
#>  stringr        1.4.0        2019-02-10 [1]
#>  svUnit         0.7-12       2014-03-02 [1]
#>  sys            3.3          2019-08-21 [1]
#>  systemfonts    0.1.1        2019-07-01 [1]
#>  testthat       2.3.0        2019-11-05 [1]
#>  tibble         2.1.3        2019-06-06 [1]
#>  tidybayes      1.1.0.9000   2019-11-17 [1]
#>  tidyr          1.0.0.9000   2019-11-17 [1]
#>  tidyselect     0.2.5        2018-10-11 [1]
#>  tidyverse      1.2.1        2017-11-14 [1]
#>  tinytex        0.17         2019-10-30 [1]
#>  utf8           1.1.4        2018-05-24 [1]
#>  vctrs          0.2.0.9007   2019-11-17 [1]
#>  viridisLite    0.3.0        2018-02-01 [1]
#>  webshot        0.5.1        2018-09-28 [1]
#>  whisker        0.4          2019-08-28 [1]
#>  withr          2.1.2        2018-03-15 [1]
#>  xfun           0.11         2019-11-12 [1]
#>  xml2           1.2.2        2019-08-09 [1]
#>  yaml           2.2.0        2018-07-25 [1]
#>  source                              
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  Github (tidyverse/ggplot2@2bc493e)  
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  Github (hrbrmstr/hrbrthemes@1a61e8f)
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  Github (atlas-aai/ratlas@fd1b575)   
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  Github (r-lib/rlang@88deeb2)        
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  Github (mjskay/tidybayes@a401ebe)   
#>  Github (tidyverse/tidyr@cb51247)    
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  Github (r-lib/vctrs@b50e5ee)        
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#> 
#> [1] /Users/w449t405/R
#> [2] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```
