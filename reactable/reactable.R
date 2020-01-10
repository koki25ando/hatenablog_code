setwd("/Users/KokiAndo/Desktop/R/hatenablog/reactable")
# install.packages("reactable")
pacman::p_load(tidyverse, DT, reactable)
mtcars %>% 
  head()


# DT package 
# 1: https://rstudio.github.io/DT/options.html
# 2: https://cran.r-project.org/web/packages/DT/DT.pdf

datatable(mtcars,
          rownames = TRUE, # 
          options = list(
            lengthMenu = c(5, 10, 15, 20, 50) # 表示するデータ観測数の調整
            ),
          caption = 'Motor Trend Car Road Tests',
          filter = "top")


# reactable
# 1: https://glin.github.io/reactable/index.html
# 2: https://github.com/glin/reactable

reactable(mtcars,
          showPageSizeOptions = TRUE,
          pageSizeOptions = c(5, 10, 15, 20, 50),
          paginationType = "jump",
          # スタイルの変更
          highlight = TRUE,
          bordered = TRUE
          )
          
