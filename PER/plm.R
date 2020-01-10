# https://nigimitama.hatenablog.jp/entry/2018/11/05/021516
setwd("/Users/KokiAndo/Desktop/R/hatenablog/PER")
pacman::p_load(tidyverse, data.table, naniar, plm)
stats = fread("Seasons_Stats.csv")
per_dat = stats %>% 
  filter(Pos %in% c("PG", "SG", "SF", "PF", "C")) %>% 
  filter(Year > 2000 & G > 20 & Age < 40 & Age > 20) %>% 
  mutate(Pos_category = ifelse(Pos %in% c("PG", "SG"), "BackCourt", "FrontCourt")) %>% 
  select(Player, Pos, Age, Pos_category, PER)

str(per_dat)
per_pdf <- pdata.frame(per_dat, index = c("Player"), drop.index=TRUE)
head(per_pdf)

plm_model = plm(PER ~ Pos_category, data = per_pdf, method = "within", effect = "individual")
summary(plm_model)

