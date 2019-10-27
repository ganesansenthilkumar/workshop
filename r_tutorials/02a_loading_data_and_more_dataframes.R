#Explore the dataframe
cats <- data.frame(coat = c("calico", "black", "tabby"), 
                    weight = c(2.1, 5.0, 3.2), 
                    likes_string = c(1, 0, 1))
write.csv(x = cats, file = "data/feline-data.csv", row.names = FALSE)

cats <- read.csv(file = "data/feline-data.csv")
cats

cats$coat
cats$weight + 2
#if you want to connect the character, you can use paste() function
paste("My cat is", cats$coat)
cats$weight + cats$coat
# add column into the dataframe
age <- c(2, 3, 5)
cats
cbind(cats, age)

age <- c(2, 3, 5, 12)
cbind(cats, age)

age <- c(2, 3)
cbind(cats, age)

nrow(cats)

length(age)

age <- c(2, 3, 5)
cats <- cbind(cats, age)

#How about adding rows? use rbind()function
#So far, you have been seen the basics of manioulating data frames with our cat data;
#now let's use those skills to digest a more reallistic dataset. 
#Let's read in the gapminer dataset that we download previously:
#let's load the data using read.csv() 
gapminder2 <- read.table(file = "data/gapminder.txt", header=TRUE, sep = "\t", stringsAsFactors = FALSE)
gapminder <- read.table(file = "data/gapminder.txt", header=TRUE, sep = "\t")
#file is the name of the file
#header indicates whether there is a header in the file. if you don't tell, the header would 123
# sep is to define the field seperator character. tells what colomns are seperated by.

#Let's investigate gapminder a bit; 
# The first thing we should always do is to check out what the data looks like
str(gapminder)
head(gapminder)
tail(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
# We will also likely want to know what the titles of all the columns are
colnames(gapminder)
#An additional method for examining the structure of gaominder is to use summary() function. 
#This function can be used on various objects in R. 
#For data frames, summary yields a numeric, tabular or descriptive summary of each column
#Factor columns are summarized by the number of items in each level;
#numeric, integer columns by the descriptive statistics(quartiles and mean);
#And character columns by its length, class and mode.
gapminder
summary(gapminder)
summary(gapminder$country)
min
max
median

#Exercise:
#Import the gapminder data frame again.

#Use `str()` to look at the structure of the dataframe and `summary()` to get information about the variables.

#What are its columns?
#How many rows and columns are there?
#What is the earliest year in the `year` column?
#What is the average life expectancy?
#What is the largest population?


#Now lets play with this data more
#How subset some data from gapminder
#First, let's get the fisrt column and first row element
gapminder[1,1] # square bracket will be used to subset the data, 
#before the comma will be the row you want to get, after the comma will be which column 

#Suppose we were interested in the life expectancy (i.e. 4th column) for 1957 for Afganistan in the years 1952, 1962, and 1977
#(i.e. rows 1, 3, and 5). How to select these multiple elements?
gapminder[c(1, 3, 5), 4]

#We can select these rows and all the columns;
gapminder[c(1, 3, 5),]

#For a ‘rectangular’ selection of rows and columns;
gapminder[20:22, 3:4]

#Negative values correspond to dropping those rows/columns;
gapminder[-3:-1704,] 

#One final method... for now!
#Instead of specifying rows/columns of interest by number, or through vectors of `TRUE`s/`FALSE`s, 
#we can also just give the names – as character strings, or vectors of character strings.
gapminder[,'lifeExp']
gapminder[,c('lifeExp','pop')]
head(gapminder[,c('lifeExp','pop')])

#We look for a specific contry and specify the columns
gapminder[gapminder$country == 'Gabon',c("lifeExp","gdpPercap")]
gapminder[gapminder$country == 'Gabon',4] # okay to mix & match












