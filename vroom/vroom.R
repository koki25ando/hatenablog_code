library(vroom)

# https://www.kaggle.com/karangadiya/fifa19
file.size("data.csv") # 9140113 (9.1MB)


system.time(
  {dat = read.csv("data.csv")}
)

system.time(
  {dat = vroom("data.csv")}
)
