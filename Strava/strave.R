# devtools::install_github("fawda123/rStrava") # Github Repository (https://github.com/fawda123/rStrava)
library(tidyverse)
library(httr)
library(rStrava)

app_name <- 'apir' # chosen by user
app_client_id  <- '35558' # an integer, assigned by Strava
app_secret <- '245a2697a03f708d626c4ee145783b3210744d3e' # an alphanumeric secret, assigned by Strava

# create the authentication token
stoken <- httr::config(token = strava_oauth(app_name, app_client_id, app_secret))
stoken <- httr::config(token = readRDS('.httr-oauth')[[1]])

# Profile data
myinfo <- get_athlete(stoken, id = '12825272')
str(myinfo)

# Activity list
my_acts <- get_activity_list(stoken)
map_chr(my_acts, "name")

# Activity  analysis
str(my_acts[[1]])
my_acts[[1]]$distance
compile_activity(my_acts[[1]])

strms_data <- get_activity_streams(my_acts, stoken, acts = 2)
str(strms_data)

## Altitude data
strms_data %>% 
  ggplot(aes(distance, altitude)) +
  geom_area(fill = "lightblue") +
  theme_classic() +
  labs(y = "Altitude (m)", x = "Distance (km)")

## Location data
library(leaflet)
leaflet(data = strms_data) %>%
  addTiles() %>% 
  setView(lng = mean(strms_data$lng), lat = mean(strms_data$lat), 
          # 便宜上、緯度経度の平均を地図の中心点に設定
          zoom = 13) %>% 
  addCircleMarkers(~lng, ~lat, radius = .5,
                   color = "blue", opacity = .1)
