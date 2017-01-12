Description
-----------

This famous (Fisher's or Anderson's) iris data set gives the
measurements in centimeters of the variables sepal length and width and
petal length and width, respectively, for 50 flowers from each of 3
species of iris. The species are Iris setosa, versicolor, and virginica.

Iris is a data frame with 150 cases (rows) and 5 variables (columns)
named Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, and Species.

Before we go to the data exploration phase, I would like to inform you
that at the end of this presentation you can find the Url link to view
the ShinyApp code and the application itself. We should use the
packages:ggplot2, rpart and datasets.

To use this application it is enough to introduce the desired plant name
in the predicted window, this makes it possible to visualize the data
recorded for each plant.

Exploration data
----------------

    suppressWarnings(library(ggplot2))
    library(rpart)
    library(datasets)
    data("iris")

    str(iris);dim(iris);names(iris)

    'data.frame':   150 obs. of  5 variables:
     $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
     $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
     $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
     $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
     $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

    [1] 150   5

    [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width" 
    [5] "Species"     

    g <- ggplot(iris, aes(x = iris$Sepal.Length, y = iris$Sepal.Width, color = iris$Species))
    g <- g + geom_point() 
    g

![](IrisData_files/figure-markdown_strict/unnamed-chunk-3-1.png)

    sub <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))
    fit <- rpart(Species ~ ., data = iris, subset = sub)
    fit

    n= 75 

    node), split, n, loss, yval, (yprob)
          * denotes terminal node

    1) root 75 50 setosa (0.3333333 0.3333333 0.3333333)  
      2) Petal.Length< 2.6 25  0 setosa (1.0000000 0.0000000 0.0000000) *
      3) Petal.Length>=2.6 50 25 versicolor (0.0000000 0.5000000 0.5000000)  
        6) Petal.Width< 1.75 28  3 versicolor (0.0000000 0.8928571 0.1071429) *
        7) Petal.Width>=1.75 22  0 virginica (0.0000000 0.0000000 1.0000000) *

Prediction
----------

    table(predict(fit, iris[-sub,], type = "class"), iris[-sub, "Species"])

                
                 setosa versicolor virginica
      setosa         25          0         0
      versicolor      0         24         2
      virginica       0          1        23

Plot
----

    plot(predict(fit, iris[-sub,], type = "class"), iris[-sub, "Species"])

![](https://github.com/xetaro/Course-Project-Shiny-Application-and-Reproducible-Pitch/blob/master/predict_plot.png)
Url:

code: <https://gist.github.com/xetaro/edd5cbf2f61ea25d18ffd0df601c523b>

illustration: <https://xetaro.shinyapps.io/myprojectapp/>

github:
<https://github.com/xetaro/Course-Project-Shiny-Application-and-Reproducible-Pitch>
