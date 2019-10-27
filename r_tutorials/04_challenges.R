# We need to implement the challenge here. Let's go through 
# http://swcarpentry.github.io/r-novice-gapminder/05-data-structures-part2/index.html
# http://swcarpentry.github.io/r-novice-gapminder/07-control-flow/index.html
# http://swcarpentry.github.io/r-novice-gapminder/08-plot-ggplot2/index.html
# to find some possibly good challenges. Especially useful if we can find challenges
# that can make life easier using dplyr which will be taught afterwards. 

gapminder = read.csv(file = "gapminder_clean.csv", stringsAsFactors = FALSE)
library(ggplot2)

meanLifeExp <- mean(gapminder$lifeExp)

# Tips for these challenes:
# Start with an empty vector using: 
# varible <- c()
# You'll want to make the vector have the values of TRUE and FALSE to grab the correct spaces in the dataframe
# The vector must be the same size as the dataframe

# CHALLENGE
# Make a ggplot of the lifeExp vs year for the continents with a higher than average life expectancy

# Answer:
conts = c()
for( cont in gapminder$continent){
  tmp <- mean(gapminder[gapminder$continent == cont, "lifeExp"])
  
  if(tmp > meanLifeExp){
    conts = c(conts, TRUE)
  }
  else{
    conts = c(conts, FALSE)
  }
}
continentsLongLived <- gapminder[conts,]
ggplot(continentsLongLived, aes(x = year, y = lifeExp, color=continent,by=country)) + geom_point() + geom_line()


### Old idea, doesn't work for some reason, but the above shows why subsetting is easier
# conts = c()
# for( cont in unique(gapminder$continent)){
#   tmp <- mean(gapminder[gapminder$continent == cont, "lifeExp"])
#   
#   if(tmp > meanLifeExp){
#     conts = c(conts, cont)
#   }
# }
# continentsLongLived <- gapminder[gapminder$continent == c("Asia","Europe","Americas","Oceania"),]
# ggplot(continentsLongLived, aes(x = year, y = lifeExp, color=continent,by=country)) + geom_point() + geom_line()





# ALT CHALLENGE
# Make a ggplot of the lifeExp vs year for the countries with a higher than average life expectancy

# Answer:
countries <- c()
for( count in gapminder$country){
  tmp <- mean(gapminder[gapminder$country == count, "lifeExp"])
  
  if(tmp < meanLifeExp){
    #print(paste("Average Life Expectancy in", count, "is more than", meanLifeExp, "plotting life expectancy graph..."))
    countries = c(countries, TRUE)
  }
  else{
    countries= c(countries, FALSE)
  }
}


shortLivedConutries <- gapminder[countries,]
ggplot(shortLivedConutries, aes(x = gdpPercap, y = lifeExp, color=continent)) + geom_point()


# Another idea:
# Use grep to grab certain countries?


