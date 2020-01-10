# install.packages("ggmap") # まだインストールしていない人用に
# devtools::install_github("dkahle/ggmap") #開発版をインストールしたい場合
library(tidyverse)
library(ggmap)
register_google("XXXXXXXXXXXXXXXXXXXXXXXXXXX") # 個人で取得したgoogle apiの登録が必要

Location = c("東京都千代田区丸の内１丁目", "東京都墨田区押上１丁目１−2", "東京都江東区豊洲６丁目３")
Place = c("東京駅", "東京スカイツリー", "豊洲マーケット")
dat = data.frame(Place, Location)

dat %>% 
  mutate(緯度 = geocode(Location)$lat,
           経度 = geocode(Location)$lon)


library(leaflet)
leaflet(data = dat) %>% 
  addProviderTiles("Stamen.TonerLite") %>% 
  setView(lng = mean(dat$経度), lat = mean(dat$緯度), zoom = 12.5) %>% 
  addCircleMarkers(~経度, ~緯度, popup = ~paste(Place, ":", Location),
                   clusterOptions = markerClusterOptions())