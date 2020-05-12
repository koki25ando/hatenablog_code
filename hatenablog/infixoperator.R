# https://qiita.com/five-dots/items/616c5f07d7a68ec70f62
# https://adv-r.hadley.nz/functions.html#function-forms

# Infix form operator: 関数名が二つの引数の間におかれる呼び出し方法、
# a %hoge% b の形態.
# Infix(接中)はPrefix(接頭)とSuffix(接尾)の中間に位置する。

# Rule
## 1 引数は二つ
## 2 関数名は%で始まり、%で終わる
## 3 Rの基本t系な関数命名規則から外れるので、さらに`で囲む

`%add%` = function(lhs, rhs) {
  result = lhs + rhs
  return(result)
}

1 %add% 4 
# 5

# 代表的な Infix 演算子
# %<>% # 右辺の結果を左辺に代入する
library(magrittr)
mtcars$mpg
mtcars$mpg %>% log()
mtcars$mpg %<>% log()
mtcars$mpg
  

# %<-% vectorやlistを分解して代入してくれる
## data.frameであれば列単位に分解してくれる
library(zeallot)
c(a, b) %<-%  c(1, 10)
print(paste0(a, ":", b))

## 全て指定するときが困難なときは...restを使うとよい

c(x, y, ...rest) %<-%  c(1, 11, 10, 3:5)
x
y
rest


# lubridate
library(lubridate)
# %--%
# %m-%
# %m+% 
# %within% 




















