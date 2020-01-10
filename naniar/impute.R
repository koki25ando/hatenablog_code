setwd("/Users/KokiAndo/Desktop/R/hatenablog/naniar")
library(naniar)
data("riskfactors")

riskfactors %>% 
  as.data.frame() %>% 
  head()


dat_ms <- tibble::tribble(~x,  ~y,    ~z,
                          1,   "A",   -100,
                          3,   "N/A", -99,
                          NA,  NA,    -98,
                          -99, "E",   -101,
                          -98, "F",   -1)

replace_with_na(dat_ms,
                replace = list(x = -99))
replace_with_na()