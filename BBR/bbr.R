setwd("/Users/KokiAndo/Desktop/R/hatenablog/BBR")
# https://github.com/sndmrc/BasketballAnalyzeR
# devtools::install_github('sndmrc/BasketballAnalyzeR') 
pacman::p_load(BasketballAnalyzeR, tidyverse)
data(package = 'BasketballAnalyzeR')

# Data sets in package ‘BasketballAnalyzeR’:
#   
# Obox                                              Opponents box scores dataset - NBA 2017-2018
# PbP.BDB                                           Play-by-play dataset - NBA 2017-2018
# Pbox                                              Players box scores dataset - NBA 2017-2018
# Tadd                                              Tadd dataset - NBA 2017-2018
# Tbox                                              Teams box scores dataset - NBA 2017-2018

PbP = PbPmanipulation(PbP.BDB)
str(PbP)
