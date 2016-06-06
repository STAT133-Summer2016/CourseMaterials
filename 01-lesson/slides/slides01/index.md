---
title       : Lesson 1
subtitle    : Introduction to R
author      : Andrew Do
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : pojoaque       # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

# Calculator

Here are some very basic things you can do in R:

R can be used as a calculator: any expressions that you type into the R console will be
computed, and the answer printed.  For example


```r
1 + 1
```

```
## [1] 2
```

```r
5 / 9
```

```
## [1] 0.5555556
```

---

You can write comments in R using the hash symbol #.


```r
# This line of code will not get evaluated.  2 + 2
## The line below this one will be though
2 + 2
```

```
## [1] 4
```

---

# Vectors

You can form vectors in R using the command `c`.  Operations are usually applied element-by-element to a vector.


```r
# Adding two vectors together
c(1, 2, 3) + c(4, 5, 6)
```

```
## [1] 5 7 9
```

```r
# Multiplying two vectors together
c(1, 2, 3) * c(1, 2, 3)
```

```
## [1] 1 4 9
```

---

# Object Assignment

You can "save" objects in memory by using either the arrow `<-` or an equal sign `=`. We call this action "assignment".


```r
# Assigning the vector (1, 2, 3) to x
x <- c(1, 2, 3)
# Assigning the vector (4, 5, 6) to y
y = c(4, 5, 6)
# Adding x and y should return (5, 7, 9)
x + y
```

```
## [1] 5 7 9
```

---

# Functions

All functions in R are called using their names followed by their arguments in parentheses (more on this later).  For example, here we take the average of `x`, which was assigned the values 1, 2, and 3 earlier.


```r
mean(x)
```

```
## [1] 2
```

---

# Getting Help in R

To get help about a function in R, you can use `help(function_name)` or `?function_name`.  For example, the following calls would fetch information about the mean function.


```r
help(mean)
?mean
```

More often than not, though, I end up deferring to StackExchange or Google.




