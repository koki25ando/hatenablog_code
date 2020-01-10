pacman::p_load(iotools, microbenchmark)


# Time the reading of files
microbenchmark(
  # Time the reading of a file using read.delim five times
  read.delim("mortgage-sample.csv", header = FALSE, sep = ","),
  # Time the reading of a file using read.delim.raw five times
  read.delim.raw("mortgage-sample.csv", header = FALSE, sep = ","),
  times = 5
)