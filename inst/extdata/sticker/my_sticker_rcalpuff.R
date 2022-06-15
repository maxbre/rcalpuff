# https://github.com/GuangchuangYu/hexSticker
library(hexSticker)
library(ggplot2)

set.seed(123)
df2 <- data.frame(x = rnorm(2000), y = rnorm(2000))

p2<-ggplot(df2, aes(x = x, y = y)) +
  geom_hex(alpha=0.8, show.legend=FALSE) +
  scale_fill_viridis_c()+
  theme_void()+
  theme_transparent()


s2<-sticker(p2, 
           package = "rcalpuff", 
           p_color = "#001f9c",
           p_size = 20, 
           p_x = 1,
           p_y = 1.5,
           s_x = 1,
           s_y = 0.8, 
           s_width = 1, 
           s_height = 1,
           spotlight = FALSE,
           l_width = 1.1,
           l_height = 1.1,
           l_alpha = 0.6,
           l_x = 0.48,
           l_y = 1.0,
           h_fill = "white",
           h_color = "#001f9c",
           filename="./rcalpuff.png")

plot(s2)
