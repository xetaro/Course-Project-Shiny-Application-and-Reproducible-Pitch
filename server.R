library(datasets)
data("iris")
str(iris)

# Edgar Anderson's Iris Data

## Description

### This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, 
### for 50 flowers from each of 3 species of iris. 
### The species are Iris setosa, versicolor, and virginica.


### iris is a data frame with 150 cases (rows) and 5 variables (columns) named Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, and Species.


## Source

### Fisher, R. A. (1936) The use of multiple measurements in taxonomic problems. Annals of Eugenics, 7, Part II, 179-188.

### The data were collected by Anderson, Edgar (1935). The irises of the Gaspe Peninsula, Bulletin of the American Iris Society, 59, 2-5.
library(shiny)

shinyServer(function(input, output) {
        
                # customize the length drop-down menu; display 5 rows per page by default
        output$mytable = renderDataTable({
                iris
        }, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
        
})
