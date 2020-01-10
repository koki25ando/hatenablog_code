pacman::p_load(tidyverse, tidyverse, NBAloveR, rvest)
data("players")
player_names = players %>% 
  filter(RookieYear >= 1990) %>% 
  pull(Player) %>% 
  unique()


length(player_names) # 2081 players



player_key_generation = function(input){
  head_url = "https://www.basketball-reference.com/players/"
  end_num = "01"
  tail_url = paste0(substr(strsplit(input, " ")[[1]][2], 0,1), "/",
                    substr(strsplit(input, " ")[[1]][2], 1,5),
                    substr(strsplit(input, " ")[[1]][1], 0,2),
                    end_num) %>% 
    stringr::str_to_lower()
  player_url = paste0(head_url, tail_url, ".html/")
  
  name_on_page = xml2::read_html(player_url) %>% 
    rvest::html_nodes("div.players") %>% 
    rvest::html_nodes("[itemprop = name]") %>% 
    rvest::html_text()
  
  if (input == name_on_page){
    player_key = tail_url
  } else {
    player_key = stringr::str_replace(tail_url, "01", "02")
  }
  
  return(player_key)
}

name = as.character(player_names[[1]])
player_key_generation(name)

advanced_stats_url_return = function(name){
  url_start = "https://www.basketball-reference.com/players/"
  url_end = ".html#all_advanced"
  
  player_name = as.character(name)
  player_key = player_key_generation(player_name)
  
  ad_stats_url = paste0(url_start, player_key, url_end)
  return(ad_stats_url)
}

url = advanced_stats_url_return(player_names[[5]])
page = read_html(url) %>% 
  html_nodes("div.table_outer_container")
page %>% 
  html_node(".overthrow") %>%
  # html_table(fill = TRUE)
  html_node("table") %>% 
  html_nodes("tbody") %>% 
  html_nodes("a")


page %>% 
  html_node("div.overthrow") %>%
  # html_node("tbody") %>% 
  html_node("thead") %>% 
  html_nodes("tr") %>% 
  html_text()

page %>% 
  html_node(".overthrow") %>%
  html_node("tbody") %>% 
  html_text()


page %>% 
  html_table("#advanced", fill = TRUE)


kg_url = "https://www.basketball-reference.com/players/g/garneke01.html"
kg_page = read_html(kg_url)

kg_page %>% 
  html_node("body") %>% 
  html_node("div#wrap") %>% 
  html_node("div#content") %>% 
  html_node("div#div_advanced_clone")



  html_nodes("thead") %>% 
  html_text()
  html_nodes("tbody") %>% 
  html_nodes("tr") %>% 
  # str
  html_text()


