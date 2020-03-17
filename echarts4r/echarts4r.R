setwd("/Users/KokiAndo/Desktop/R/hatenablog/echarts4r")
# ------------------------ Package Loading -----------------------------------
pacman::p_load(echarts4r, echarts4r.maps, tidyverse, data.table)

# ------------------------ Data Preparation -----------------------------------
byDate <- fread('data/byDate.csv', header = T) # https://github.com/swsoyee/2019-ncov-japan/blob/5fc98d771d/Data/byDate.csv
provinceCode <- fread('data/prefectures.csv') # https://github.com/swsoyee/2019-ncov-japan/blob/5fc98d771d/Data/prefectures.csv




byDate[is.na(byDate)] <- 0
byDate$date <- lapply(byDate[, 1], function(x){as.Date(as.character(x), format = '%Y%m%d')})

dt <- data.frame(date = byDate$date)
for (i in 2:ncol(byDate)) {
  dt[, i] = cumsum(byDate[, i, with = F])
}
dt <- reshape2::melt(dt, id.vars = 'date')
mapDt <- data.table(dt)

mapDt <- mapDt[!(variable %in% c('クルーズ船', 'チャーター便', '検疫職員'))]
mapDt <- merge(x = mapDt, y = provinceCode, by.x = 'variable', by.y = 'name-ja', all = T)
mapDt <- mapDt[, .(date, variable, `name-en`, value)]
colnames(mapDt) <- c('date', 'ja', 'en', 'count')
nameMap <- as.list(mapDt$ja)
names(nameMap) <- mapDt$en

# ------------------------ Map Visualization -------------------------

mapDt %>%
  group_by(date) %>% 
  e_charts(ja, timeline = T) %>%
  em_map("Japan") %>%
  e_map(count, map = "Japan",
        name = '感染確認数', roam = T,
        nameMap = nameMap,
        layoutSize = '50%',
        center = c(137.1374062, 36.8951298),
        zoom = 1.5,
        scaleLimit = list(min = 1, max = 4)) %>%
  e_visual_map(
    count,
    top = '30%',
    left = '0%',
    inRange = list(color = c('#EEEEEE', "#DD4B39", "#B03C2D")),
    type = 'piecewise',
    splitList = list(
      list(min = 50),
      list(min = 30, max = 50),
      list(min = 10, max = 30),
      list(min = 5, max = 10),
      list(min = 1, max = 5),
      list(value = 0)
    )
  ) %>% 
  e_color(background = '#FFFFFF') %>% 
  e_tooltip()
  
