# EDA on Diamonds Dataset #

library(dplyr)
library(ggplot2)

data(diamonds)

head(diamonds)
tail(diamonds)
str(diamonds)
summary(diamonds)

# Diamonds on scatterplot with smooth line
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point(alpha = .01) +
  geom_smooth(aes(color=cut))

# Diamonds on scatterplot with smooth line and regression line for filtered diamonds
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point() +
  geom_smooth() +
  geom_smooth(method = "lm", color = "red", data = diamonds[diamonds$carat < 3,])

# Diamonds on geom_hex for many observations
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_hex()

# Diamonds mean price, mean carat and count by cut
diamonds %>%
  group_by(cut) %>%
  summarise(Œrednia = mean(price),
             carat = mean(carat),
             N = n())

# Distribution of price
ggplot(data=diamonds, aes(x=price)) +
  geom_histogram()

# Distribution for different groups
ggplot(data=diamonds, aes(x=price, fill=cut)) +
  geom_histogram(binwidth = 500)

ggplot(data=diamonds, aes(x=price, color=cut)) +
  stat_bin(position="dodge", geom = "line", size=2, bins = 50)

ggplot(data=diamonds, aes(x=price, color=cut)) + 
  stat_bin(position="dodge", geom = "step", size=2, binwidth = 500)

ggplot(data=diamonds, aes(x=price, fill=cut)) +
  stat_bin(position="fill", binwidth = 400)

# Boxplot with mean point

ggplot(data=diamonds, aes(x=cut, y=price, fill=cut)) + geom_boxplot() +
  stat_summary(fun = mean, geom = "point", shape = 15, color="red", size=3)
