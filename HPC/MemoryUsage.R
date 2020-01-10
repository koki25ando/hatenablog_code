setwd("/Users/KokiAndo/Desktop/R/hatenablog/HPC")
dir()





dat = fread("train_identity.csv")
print(object.size(dat), unit = "Mb")
sapply(dat, class) %>% table
# 44.7 Mb
# character   integer   numeric 
# 17         1        23



dat = read.csv("train_identity.csv")
print(object.size(dat), unit = "Mb")
sapply(dat, class) %>% table
# 35.4 Mb
# factor integer logical numeric 
# 13       1       4      23




sapply(dat, class) %>% table
numeric_vars <- names(full)[sapply(full, class) == "numeric"]
max_val <- sapply(full[numeric_vars], function(x) max(x, na.rm=T))
print(sum(max_val > .Machine$integer.max))


full[int_vars] <- lapply(full[int_vars], as.integer)

after <- object.size(full)
print(paste("After :", format(after, units = "MB") ))   

rm(max_val, nunique)
gc()