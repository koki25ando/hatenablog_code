# codes for http://kokiando.hatenablog.com/entry/2019/05/26/125642

# Prep
library(tidyverse)
library(highcharter)
library(xts)
stock = read.csv("all_stocks_5yr.csv") # from https://www.kaggle.com/camnugent/sandp500
fang = filter(stock, Name %in% c("AAPL", "AMZN", "FB", "NFLX", "GOOGL"))
fang$date = as.Date(fang$date)
fang = filter(fang, date > "2016-01-01")

# tibble visualization
hchart(filter(fang, Name == "GOOGL"), 
       hcaes(x = date, y = close),
       type = "line", color = "red")

hchart(filter(fang, Name == "GOOGL"), 
       hcaes(x = date, y = close),
       type = "candlestick")
# Multiple data
hchart(fang, 
       hcaes(x = date, y = close, group = Name),
       type = "line")

# xts data visualization
google = fang %>% 
  filter(Name == "GOOGL") %>% 
  select(date, close)
amazon = fang %>% 
  filter(Name == "AMZN") %>% 
  select(date, close)
amazon_xts = as.xts(amazon$close, amazon$date)
google_xts = as.xts(google$close, google$date)

highchart(type = "stock") %>% 
  hc_add_series(amazon_xts)

highchart(type = "stock") %>% 
  hc_add_series(amazon_xts, color = "yellow", name = "AMAZON") %>% 
  hc_add_series(google_xts, color = "red", name = "GOOGLE")