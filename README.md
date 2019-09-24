
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Bayesian Psychometrics for Dynamic Learning Maps: A Proof of Concept

This repository contains the source code for the Technical Report,
*Bayesian psychometrics for Dynamic Learning Maps: A proof of concept*.
The report is powered by [**bookdown**](https://bookdown.org), which
makes it easy to turn R markdown files into PDF.

This report was built
with:

``` r
devtools::session_info(c("ratlas", "knitr", "english", "kableExtra", "tidyverse",
                         "rstan", "loo", "tidybayes",
                         "here", "glue", "fs"))
#> ─ Session info ──────────────────────────────────────────────────────────
#>  setting  value                       
#>  version  R version 3.6.1 (2019-07-05)
#>  os       macOS Mojave 10.14.6        
#>  system   x86_64, darwin15.6.0        
#>  ui       X11                         
#>  language (EN)                        
#>  collate  en_US.UTF-8                 
#>  ctype    en_US.UTF-8                 
#>  tz       America/Chicago             
#>  date     2019-09-24                  
#> 
#> ─ Packages ──────────────────────────────────────────────────────────────
#>  package      * version      date       lib
#>  arrayhelpers   1.0-20160527 2016-05-28 [1]
#>  askpass        1.1          2019-01-13 [1]
#>  assertthat     0.2.1        2019-03-21 [1]
#>  backports      1.1.4        2019-04-10 [1]
#>  base64enc      0.1-3        2015-07-28 [1]
#>  BH             1.69.0-1     2019-01-07 [1]
#>  bookdown       0.13         2019-08-21 [1]
#>  broom          0.5.2        2019-04-07 [1]
#>  callr          3.3.2        2019-09-22 [1]
#>  cellranger     1.1.0        2016-07-27 [1]
#>  checkmate      1.9.4        2019-07-04 [1]
#>  cli            1.1.0        2019-03-19 [1]
#>  clipr          0.7.0        2019-07-23 [1]
#>  coda           0.19-3       2019-07-05 [1]
#>  colorspace     1.4-1        2019-03-18 [1]
#>  crayon         1.3.4        2017-09-16 [1]
#>  curl           4.1          2019-09-16 [1]
#>  DBI            1.0.0        2018-05-02 [1]
#>  dbplyr         1.4.2        2019-06-17 [1]
#>  desc           1.2.0        2018-05-01 [1]
#>  digest         0.6.21       2019-09-20 [1]
#>  dplyr          0.8.3        2019-07-04 [1]
#>  ellipsis       0.2.0.9000   2019-09-22 [1]
#>  english        1.2-3        2019-03-23 [1]
#>  evaluate       0.14         2019-05-28 [1]
#>  extrafont      0.17         2014-12-08 [1]
#>  extrafontdb    1.0          2012-06-11 [1]
#>  fansi          0.4.0        2018-10-05 [1]
#>  forcats        0.4.0        2019-02-17 [1]
#>  fs             1.3.1        2019-05-06 [1]
#>  gdtools        0.2.0        2019-09-03 [1]
#>  generics       0.0.2        2018-11-29 [1]
#>  ggplot2        3.2.1.9000   2019-09-14 [1]
#>  ggstance       0.3.3        2019-08-19 [1]
#>  glue           1.3.1        2019-03-12 [1]
#>  gridExtra      2.3          2017-09-09 [1]
#>  gtable         0.3.0        2019-03-25 [1]
#>  haven          2.1.1        2019-07-04 [1]
#>  HDInterval     0.2.0        2018-06-09 [1]
#>  here           0.1          2017-05-28 [1]
#>  highr          0.8          2019-03-20 [1]
#>  hms            0.5.1        2019-08-23 [1]
#>  hrbrthemes     0.7.2        2019-08-12 [1]
#>  htmltools      0.3.6        2017-04-28 [1]
#>  httr           1.4.1        2019-08-05 [1]
#>  hunspell       3.0          2018-12-15 [1]
#>  inline         0.3.15       2018-05-18 [1]
#>  jsonlite       1.6          2018-12-07 [1]
#>  kableExtra     1.1.0        2019-03-16 [1]
#>  knitr          1.25         2019-09-18 [1]
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
#>  pkgbuild       1.0.5        2019-08-26 [1]
#>  pkgconfig      2.0.3        2019-09-22 [1]
#>  plogr          0.2.0        2018-03-25 [1]
#>  plyr           1.8.4        2016-06-08 [1]
#>  prettyunits    1.0.2        2015-07-13 [1]
#>  processx       3.4.1        2019-07-18 [1]
#>  progress       1.2.2        2019-05-16 [1]
#>  ps             1.3.0        2018-12-21 [1]
#>  purrr          0.3.2        2019-03-15 [1]
#>  R6             2.4.0        2019-02-14 [1]
#>  ratlas         0.0.0.9000   2019-09-24 [1]
#>  RColorBrewer   1.1-2        2014-12-07 [1]
#>  Rcpp           1.0.2        2019-07-25 [1]
#>  RcppEigen      0.3.3.5.0    2018-11-24 [1]
#>  readr          1.3.1        2018-12-21 [1]
#>  readxl         1.3.1        2019-03-13 [1]
#>  rematch        1.0.1        2016-04-21 [1]
#>  reprex         0.3.0        2019-05-16 [1]
#>  reshape2       1.4.3        2017-12-11 [1]
#>  rlang          0.4.0.9002   2019-09-14 [1]
#>  rmarkdown      1.15         2019-08-21 [1]
#>  rprojroot      1.3-2        2018-01-03 [1]
#>  rstan          2.19.2       2019-07-09 [1]
#>  rstudioapi     0.10         2019-03-19 [1]
#>  Rttf2pt1       1.3.7        2018-06-29 [1]
#>  rvest          0.3.4        2019-05-15 [1]
#>  scales         1.0.0        2018-08-09 [1]
#>  selectr        0.4-1        2018-04-06 [1]
#>  StanHeaders    2.19.0       2019-09-07 [1]
#>  stringi        1.4.3        2019-03-12 [1]
#>  stringr        1.4.0        2019-02-10 [1]
#>  svUnit         0.7-12       2014-03-02 [1]
#>  sys            3.3          2019-08-21 [1]
#>  systemfonts    0.1.1        2019-07-01 [1]
#>  tibble         2.1.3        2019-06-06 [1]
#>  tidybayes      1.1.0        2019-06-02 [1]
#>  tidyr          1.0.0.9000   2019-09-24 [1]
#>  tidyselect     0.2.5        2018-10-11 [1]
#>  tidyverse      1.2.1        2017-11-14 [1]
#>  tinytex        0.16         2019-09-17 [1]
#>  utf8           1.1.4        2018-05-24 [1]
#>  vctrs          0.2.0.9002   2019-09-14 [1]
#>  viridisLite    0.3.0        2018-02-01 [1]
#>  webshot        0.5.1        2018-09-28 [1]
#>  whisker        0.4          2019-08-28 [1]
#>  withr          2.1.2        2018-03-15 [1]
#>  xfun           0.9          2019-08-21 [1]
#>  xml2           1.2.2        2019-08-09 [1]
#>  yaml           2.2.0        2018-07-25 [1]
#>  zeallot        0.1.0        2018-01-28 [1]
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
#>  Github (r-lib/ellipsis@dc23a8c)     
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  Github (tidyverse/ggplot2@23e3241)  
#>  CRAN (R 3.6.0)                      
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
#>  Github (atlas-aai/ratlas@59c0ef2)   
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  Github (r-lib/rlang@b1dfdd0)        
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
#>  Github (tidyverse/tidyr@4787b2a)    
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  Github (r-lib/vctrs@f7d2492)        
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.1)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#>  CRAN (R 3.6.0)                      
#> 
#> [1] /Users/w449t405/R
#> [2] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```
