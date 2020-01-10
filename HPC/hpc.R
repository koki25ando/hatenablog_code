setwd("/Users/KokiAndo/Desktop/R/hatenablog/hpc")
pacman::p_load(tidyverse, bigmemory, data.table, tictoc)

tic()
ie_dat = fread("ie_dat_treated.csv")  
toc() #

tic()
ie_dat_big = read.big.matrix("ie_dat_treated.csv",
                header = T)
toc() # 