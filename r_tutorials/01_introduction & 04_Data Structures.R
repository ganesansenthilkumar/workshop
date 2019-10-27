#Welcome to the R portion of the Software Carpentry workshop.

#Throughout this lesson, we’re going to teach you some of the fundamentals of the R language as well as some best practices 
#for organizing code for scientific projects that will make your life easier.

#intro - why learn R
#dataframes, data anaylsis and plotting

# What is R? 

# R is a ‘programming environment for statistics and graphics’

# * Does basically everything, can also be extended
# * It’s the default when statisticians implement new methods
# * Free, open-source

# But;

# * Steeper learning curve than e.g. Excel, Stata
# * Command-line driven (programming, not drop-down menus)
# * Gives only what you ask for!

# What is RStudio?

# Often, learning a programming language is made worse by an unintuitive and unhelpful user interface.  
# For our workshop, we will be using RStudio, a graphical user interface (front-end) for R that is slightly more user-friendly than ‘Classic’ R’s GUI.
#It is a free, open source R integrated development environment. 
#It provides a built in editor, works on all platforms (including on servers) 
#and provides many advantages such as integration with version control and project management.

#Basic layout

#When you first open RStudio, you will be greeted by three panels:

#The interactive R console (entire left)
#Environment/History (tabbed in upper right)
#Files/Plots/Packages/Help/Viewer (tabbed in lower right)

# The console window  
#Much of your time in R will be spent in the R interactive console. This is where you will run all of your code, 
#and can be a useful environment to try out ideas before adding them to an R script file
# There are some useful features available in the console:

# * Use the UP arrow to see past commands you have typed
# * Help window appears as you type to help you complete your thought
# * Tab autocomplete
#     + When just typing, use tab autocomplete to fill in object names for you
#     + When inside quotes `'  '`, you can press tab to help you spell folder names correctly


#can use R as a calculator, good example for using the console
3+2
4/3
3*3
'hello world'
#R follows math rules and will do the work in the parenthesis
(4+2)*4
(4+
# If there is an error, such as not having a closed parethesis, 
# the R console with let you know with a '+' in place of the '>'
2)*4


#data types
#Number types: numerics, integers, complex, 
3
9
5
2.356

#integers are specificed with an L, ex. 2L -> look up why integers are different from numerics
#interger are the numers without decimal. In R, you can define the interger by adding L suffix, or 
#you can use function as.interger() to define a integer

3L
as.integer(3.14)

#complex we studied in math class
3+1i

#word type: character, logical
'dog'
'plant'
TRUE
FALSE
class(3) == class(3L)
3 == 3L
300 > 200
0 > 999
'abc' != 'ABC'

#Exercise:
#Which of the following will NOT return TRUE?    
#A. FALSE == FALSE  
#B. 10-5 == sqrt(25)  
#C. TRUE > FALSE  
#D. 'a' > 'b'


#why here are serveral datatypes? because sometime the data input some R package required  need to be specific datatypes

#varibles
#motivation: a way to store information
#A variable is a keyword that you define the meaning of in R
dog
#we get an error, because R doesn't know what dog is
dog <- 3
dog
#now R has a definition for dog and it no longer causes an error.
#R doesn't need varible to make sense
#But it is a good idea to have the varible make sense, so you and others can follow what your code does
typeof(dog)
class(dog)

# How to find help in R or you can type the function in serach box under the help tab or google it
?class()

#What’s a good name for my new object?

#Variable names can contain letters, numbers, underscores and periods. They cannot start with a number nor contain spaces at all. 
#Different people use different conventions for long variable names, these include

#periods.between.words
#underscores_between_words
#camelCaseToSeparateWords

#Something memorable (!) and not easily-confused with other objects, e.g. X isn’t a good choice if you already have x
#Names must start with a letter or period (”.”), after that any letter, number or period is okay
#Avoid other characters; they get interpreted as math (”-”,”*”) or are hard to read (” ”) so should not be used in names
#Avoid names of existing functions – e.g. summary. Some oneletter choices (c, C, F, t, T and S) are already used by R as names of functions, it’s best to avoid these too

#exercise
#Which of the following are valid R variable names?

#min_height
#max.height
#_age
#.mass
#MaxLength
#min-length
#2widths
#celsius2kelvin

x <- 3
y <- 2
x+y
#Exercise
#What is the output when we execute the following code?
#x <- 3
#y <- 2
#y <- 17.4
#x+y

#A. [1] 3  2  17.4  
#B. [1] 22.4    
#C. [1] 20.4   
#D. [1] 5  


# 4 Data Structures
#motivation go through the data structure in R, give you guys some examples
# 1. Atomic Vector
# 2. List
# 3. Matrix
# 4. Data Frame

# Atomic Vectors
#A object that holds multiple pieces of information, 
#is essentially on ordered list of things, with the special condition that everything in the vector mush be the same basic data type
#if you don't choose the datatype, it will default to logical; or you can define an empty vector of whatever type you like.
1:10
-1:-3
num_vector <- 1:5
logic_vector <- c(TRUE, TRUE, FALSE, TRUE)
char_vector <- c("Asher", "Matt", "Sean")
#you can expand a vector, using itself as a varible
#here we redfine char_vector while using char_vector as a variable
char_vector <- c(char_vector, "Heather", "Andreina")
char_vector
length(char_vector)
class(char_vector)

# you can combine different types of data into a vector
mixed <- c(TRUE, "A")
mixed
#When you looked at the mixed, it said the TRUE is a cha, rather than logical, telling us vector can only hold the same datatype
#So if you want different datatype stored together in one object, thats called list
# Lists
# you use list() to make a list
my_list <- list(1, "A", TRUE)
my_list
my_list[1]
my_list[2]
my_list[3]

# you can give each element of the list a name
phonebook <- list(name="Asher", phone="111-1111", age=27)
phonebook["name"]

# Matricies
# a mtrix is multipe of rows and columns of data, holding the same datatype with 2 dimensions
m <- matrix(nrow=2, ncol=3)
m
# give the matrix some data 1 to 6 formated as 2 rows and 3 columns 
m <- matrix(1:6, nrow=2, ncol=3)
m
m <- matrix(1:6, nrow=2, ncol=3, byrow=TRUE)
m

# Data Frames
# As we go through the data structure, it get more complex, vector, list, matrix, 
# dataframe is the most complex one, and the most common data structure we use in real life, each column can hold different datatypes
df <- data.frame(id=letters[1:10], x=1:10, y=11:20)
df
class(df)
typeof(df)
#if you have a very large dataframe, here are a few commandlines showing what the pieces of data look like
head(df)
tail(df)
#learn the size of the dataframe, know how much data you should have, making sure you are woking on the right data,
#like, incomplete downloading
nrow(df)
ncol(df)
dim(df)
str(df)
names(df)

# summary can help do some basic calculations, like the mean, max, min, median and so on.
summary(df)


