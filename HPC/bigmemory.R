setwd("/Users/KokiAndo/Desktop/R/hatenablog/HPC")
pacman::p_load(microbenchmark, bigmemory, data.table, biganalytics)
microbenchmark(rnorm(100), rnorm(1000))

# mort_csv = fread("mortgage-sample.csv")
# Create the big.matrix object: x
x <- read.big.matrix("mortgage-sample.csv", 
                     header = TRUE, 
                     type = "integer", 
                     backingfile = "mortgage-sample.bin", 
                     descriptorfile = "mortgage-sample.desc")

# Attach mortgage-sample.desc
mort <- attach.big.matrix("mortgage-sample.desc")

print(object.size(mort))      # 696 bytes
#print(object.size(mort_csv)) # 4484280 bytes


# Find the dimensions of x
dim(x)
# Look at first 5 rows
head(mort)
# Create mort
mort <- attach.big.matrix("mortgage-sample.desc")
# Look at the first 3 rows
mort[1:3, ]
# Create a table of the number of mortgages for each year in the data set
table(mort[, 'year'])

# Get the column means of mort
colmean(mort)
# Use biganalytics' summary function to get a summary of the data
summary(mort)



library(bigtabulate)
bigtable(mort, "year")

head(mort[, "borrower_race"])
mort_df = as.data.frame(mort)
