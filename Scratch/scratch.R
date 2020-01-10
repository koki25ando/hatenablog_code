data("mtcars")
head(mtcars)
mtcars %>% 
  ggplot(aes(mpg, wt)) +
  geom_point()

lm_model = lm(wt ~ mpg, mtcars)
summary(lm_model)

y = mtcars$wt
x = mtcars$mpg
explanatory_var = mtcars$mpg
response_var = mtcars$wt

slr_scratch = function(explanatory_var, response_var, plot_show = F){
  
  y = explanatory_var
  x = response_var
  
  x_mean = mean(x)
  y_mean = mean(y)
  size = length(x)
  x_variance = sum(((x - x_mean)^2))/(size-1)
  xy_covariance = sum((x-x_mean)*(y-y_mean))/(size-1)
  xy_coefience = xy_covariance/x_variance
  y_intercept = y_mean - x_mean*xy_coefience 
  
  if (plot_show){
    data.frame(explanatory_var, response_var) %>% 
    ggplot(aes(explanatory_var, response_var)) +
      geom_point()
  }
  
}


# Multiple Linear Regression 
mtcars %>% 
  # head()
  select(drat, wt, disp) %>% 
  data.table() %>% 
  pairs()

mlr = lm(drat ~ wt + disp, mtcars)
# Coefficients:
#   (Intercept)           wt         disp  
#      4.641538    -0.211315    -0.001583 

res_var = mtcars$drat
expl_1 = mtcars$wt
expl_2 = mtcars$disp
rsq = function(x,y) cor(x, y) ^ 2
res_sd = sd(res_var)
r21 = cor(expl_1, expl_2) # 0.8879799


b1 = (cor(res_var, expl_1)-(cor(res_var, expl_2)*r21))/(1-r21^2)*(res_sd/sd(expl_1))
b2 = (cor(res_var, expl_2)-(cor(res_var, expl_1)*r21))/(1-r21^2)*(res_sd/sd(expl_2))
b0 = mean(res_var) - b1*mean(expl_1) - b2*mean(expl_2)
b1 # -0.2113154        :-0.211315
b2 # -0.001582515      :-0.001583
b0 # 4.641538          :4.64154
