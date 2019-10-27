# This lesson is based on SCW's 
# R for Reproducible Scientific Analysis, lesson 08
# http://swcarpentry.github.io/r-novice-gapminder/08-plot-ggplot2/index.html

# Let learn how to plot data using ggplot and the gapminder data we have been using
# ggplot is a library for R that produces publication quality plots

#How to install a new package
install.packages("ggplot2")

#Don't forget to load the package so we can use its functionality
library(ggplot2)

# Shouldn't need the blow command
# setwd("~/SCW_R_Oct_2019")


gapminder = read.csv(file = "gapminder_clean.csv", stringsAsFactors = FALSE)

?ggplot
# ggplot2 is built on the grammar of graphics, the idea that any plot can be expressed from the same set of components: 
# a data set, 
# a coordinate system, 
# and a set of geoms–the visual representation of data points.

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Breaking down ggplot
# 1. ggplot wants to know the data set to use
# 2. ggplot wants to know what varibles to use and how to display them with aes or aesthetic
#     Note that ggplot knows that gdpPercap and lifeExp parts of the gapminder data set
#     So we don't need to use something like x = gapminder[, "gdpPercap"]
# 3. ggplot needs to know how you want to visualize the data

# Challange:
# How would we look at life expectancy overtime with ggplot

# Answer:
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
  geom_point()

# What does this plot tell us?
# Life expectancy looks like it overall goes up.
# Do the students have an idea how to make it more useful?

# Challenge:
# Try to add color
# There is a color argument for the aes function
# You can can tell ggplot to color by continent

# Answer:
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent)) +
  geom_point()
# What does this tell us now?
# Note: Each point is a different country that falls under each continent

# Let's try to diplay this in a different way
# for geom_line() we want to tell ggplot how the lines should be connected
# in this case, by countries
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line()

# We can combine two forms of visualization
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line() + geom_point()

# We can be selective about additional arguments based on type of visualization
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_line(mapping = aes(color=continent)) + geom_point()
# The ase arguments in the first part are gloable, and will apply to everything you plot
# The ase arguments in geom_...() are specific to that piece of the visualization
# In this way ggplot is like a plot with various layers

# Challenge:
# Switch the order of the geom_ functions
# What happened?

# Answer:
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_point() + geom_line(mapping = aes(color=continent))

# Let do some stats in our plots!

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Let's first make the relationship easier to visualize
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()
# alpha controls the opaquness of the points from geom_point
# scale_x_log10() makes the plot's x-axis on a log scale instead of linear

# # Tip
# # alpha can be based on the country by using:
# # geom_point(mapping = aes(alpha = continent))
# ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, alpha = continent)) +
#   geom_point() + scale_x_log10()

#But let's not
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()

# Let's fit a linear model to the data!
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + scale_x_log10() + geom_smooth(method="lm")

# We can alter the line for the linear model
# For example, the lines thickness
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + scale_x_log10() + geom_smooth(method="lm", size=1.5)

# Note:
# We are not using ase for changing the size

# Challenge:
# Change the color and size of the points outside of aes

# Note:
?geom_point

# Answer:
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size=3, color="green") + scale_x_log10() +
  geom_smooth(method="lm", size=1.5)


# Challange:
# Now change the shape of the points and
# color the points by the continent
# Note:
# You'll get multiple linear model fits

# Note:
?geom_point

# Answer:
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(size=3, shape=17) + scale_x_log10() +
  geom_smooth(method="lm", size=1.5)


# Let's do some plots with subplots!
# The life expectancy data was very cluttered
# Perfect for breaking up into multiple plots!
# We'll start with just American countries so we don't have too many subplots
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x = year, y = lifeExp)) +
  geom_line() + 
  facet_wrap( ~ country) + 
  theme(axis.text.x = element_text(angle = 45))
?facet_wrap
# facet_wrap makes ggplot do subplots based on the country within americas
?theme
# theme lets us modify the text on the plot to make it easier to read
# Would you see this in a research paper?
#y-axis lable says "lifeExp"
#

# More text modification!
ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  labs(
    x = "Year",              # x axis title
    y = "Life expectancy",   # y axis title
    title = "Figure 1",      # main title of figure
    color = "Continent"      # title of legend
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
# labs function allows for us to specify the figure text

# Let's save our work!
# We can put the plot into a varible and then use the ggsave function to save the plot
lifeExp_plot <- ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  labs(
    x = "Year",              # x axis title
    y = "Life expectancy",   # y axis title
    title = "Figure 1",      # main title of figure
    color = "Continent"      # title of legend
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


ggsave(filename = "results/lifeExp.png", plot = lifeExp_plot, width = 12, height = 10, dpi = 300, units = "cm")
# R will not want to save a file if a directory already exists
# We can use R to make a directory like we did in Unix
# dir.create(file.path('~/SCW_R_Oct_2019/', 'results'))
# If the directory is already made, R will cause a running to script crash
# So we add an argument showWarnings = FALSE
dir.create(file.path('./', 'results'), showWarnings = FALSE)
# Let's comment out the 
# dir.create(file.path('~/SCW_R_Oct_2019/', 'results'))

ggsave(filename = "results/lifeExp.png", plot = lifeExp_plot, width = 12, height = 10, dpi = 300, units = "cm")


# Cheat sheet for ggplot:
# https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

# Challenge!
# Create a density plot of GDP per capita, filled by continent.
# 
# Advanced:
# Transform the x axis to better visualise the data spread.
# Add a facet layer to panel the density plots by year.

# Answer:
ggplot(data = gapminder, mapping = aes(x = gdpPercap, fill=continent)) +
  geom_density(alpha=0.6)# + facet_wrap( ~ year) + scale_x_log10()
# Advanced answer:
ggplot(data = gapminder, mapping = aes(x = gdpPercap, fill=continent)) +
  geom_density(alpha=0.6) + facet_wrap( ~ year) + scale_x_log10()




###############################################
###########         IF TIME         ###########
###############################################
# Boxplots
ggplot(data=gapminder, mapping = aes(x=continent, y=lifeExp, color=continent)) +
  geom_boxplot()

ggplot(data=gapminder, mapping = aes(x=continent, y=lifeExp, fill=continent)) +
  geom_boxplot()


###############################################
###########         IF TIME         ###########
###############################################

