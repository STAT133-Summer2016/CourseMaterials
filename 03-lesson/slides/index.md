---
title       : Lesson 3
subtitle    : Data Structures in R
author      : Andrew Do
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : pojoaque      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

# Data Types in R

* Numeric - regular (real) numbers (also known as double)
* Integer - well... integers
* Character - text (also known as strings)
* Logical - `TRUE` and `FALSE` values
* Complex - complex values (with imaginary components)

---

# Examples

Type       | Examples
---------- | --------
Numeric    | -0.5, 2
Integer    | 3, 8
Complex    | 2 + 1i
Logical    | TRUE, FALSE
Character  | "hello world"

---

# Special Values

There are some special values:

* NULL is completely empty, no data type, no length
* NA denotes a missing value.  It takes on a data type!
* Inf is positive infinity
* NaN is Not a Number

---

# Vectors

* Vectors are the most basic data type in R
* For those coming from another language: There are no numerical primitizes. In other words, all naked numbers are double-width floating-point atomic vectors of length one. 
* Vectors are atomic, meaning they can only hold one type of data
* You create vectors with `c()`
* You can create a sequence of consecutive numbers with `:`

```r
# This is a vector
1:6
```

```
## [1] 1 2 3 4 5 6
```

```r
# So is this
1
```

```
## [1] 1
```

---

# Atomic Vector Examples


```r
# Vectors can only hold one type of data
# Everything converted into strings
c("a", "b", 1, 2, FALSE)
```

```
## [1] "a"     "b"     "1"     "2"     "FALSE"
```

```r
# Everything converted into numeric
x <- c(1, 0, FALSE, TRUE)
x
```

```
## [1] 1 0 0 1
```

```r
class(x)
```

```
## [1] "numeric"
```

---

# More Vector Info

* Vectors are always 1-dimensional, even if you try to nest `c()`

```r
c(1, c(2, 3), c(4))
```

```
## [1] 1 2 3 4
```
* This, in fact, is how you join vectors together

```r
x <- 1:3
y <- 4:6
c(x, y)
```

```
## [1] 1 2 3 4 5 6
```

---

# Named Vectors
You can create named vectors. This allows you to subset using the names

```r
x <- c(first = "a", second = "b", third = "c")
x
```

```
##  first second  third 
##    "a"    "b"    "c"
```

```r
x["second"]
```

```
## second 
##    "b"
```

```r
x[c("first", "third")]
```

```
## first third 
##   "a"   "c"
```

---

# Accessing Names and Renaming
You can use `names()` to print the names or to overwrite them

```r
names(x) 
```

```
## [1] "first"  "second" "third"
```

```r
names(x) <- c("alpha", "beta", "gamma") # renaming all the values
x
```

```
## alpha  beta gamma 
##   "a"   "b"   "c"
```

```r
names(x)[2] <- "bubbles" # renaming the second element
x
```

```
##   alpha bubbles   gamma 
##     "a"     "b"     "c"
```

---

# Testing data type
You can determine type with `typeof`.  If you want to test for a specific type, use an "is" function: `is.character()`, `is.double()`, `is.integer()`, `is.logical()`.

```r
int_var <- c(1L, 6L, 10L) # You differentiate integers from doubles with the L
typeof(int_var)
```

```
## [1] "integer"
```

```r
is.integer(int_var)
```

```
## [1] TRUE
```

```r
is.double(int_var)
```

```
## [1] FALSE
```

---

# Coercion
You can explicitly coerce a vector using the `as` functions: `as.numeric`, `as.character`, `as.integer`, `as.logical`.

```r
x <- c(1, 2, 3)
typeof(x)
```

```
## [1] "double"
```

```r
x <- as.integer(x)
typeof(x)
```

```
## [1] "integer"
```

```r
as.logical(c(1, 1, 0, 0, 1))
```

```
## [1]  TRUE  TRUE FALSE FALSE  TRUE
```

---

# Implicit Coercion
When you call on a function that doesn't make sense with a certain data type, `R` will try to find a data type that it will work on.  This is called _implicit coercion_.

```r
# Logicals are converted into 1s and 0s in sum
sum(c(T, F, T, F, F))
```

```
## [1] 2
```

```r
# Numerical values converted into logicals for &, |, any, etc.
# If R thinks you might lose information, it gives you a warning
any(c(1, 1, 0, 0))
```

```
## Warning in any(c(1, 1, 0, 0)): coercing argument of type 'double' to
## logical
```

```
## [1] TRUE
```

---

# Lists
Lists, unlike vectors, can contain more than one data type.  They are _recursive_ objects, meaning that lists can contain lists.  You create lists using the `list()` command.

```r
list("a", 1, FALSE, 5 + 3i)
```

```
## [[1]]
## [1] "a"
## 
## [[2]]
## [1] 1
## 
## [[3]]
## [1] FALSE
## 
## [[4]]
## [1] 5+3i
```

---

# More list examples

```r
# List with lists
list("fruits", c("apples", "bananas", "cranberries"), list("other things"))
```

```
## [[1]]
## [1] "fruits"
## 
## [[2]]
## [1] "apples"      "bananas"     "cranberries"
## 
## [[3]]
## [[3]][[1]]
## [1] "other things"
```

```r
# Named list
list(fruits = c("apples", "bananas", "cranberries"))
```

```
## $fruits
## [1] "apples"      "bananas"     "cranberries"
```

---

# Accessing Items in a list
You can get items in a list:

* By position, with `[[]]`
* By name (if it's named) with `$` or `[[]]`

```r
x <- list('first' = "a", 'second' = "b", 'third' = "c")
x[[1]]
```

```
## [1] "a"
```

```r
x$first
```

```
## [1] "a"
```

```r
x[["first"]]
```

```
## [1] "a"
```

---

# Getting/Changing the Names of a list
Like with vectors, you can use `names` to get and change the names in a list


```r
x <- list('first' = "a", 'second' = "b", 'third' = "c")
names(x)
```

```
## [1] "first"  "second" "third"
```

```r
names(x) <- c("apples", "bananas", "cherries")
x
```

```
## $apples
## [1] "a"
## 
## $bananas
## [1] "b"
## 
## $cherries
## [1] "c"
```

---

# Matrices and Arrays
Matrices and Arrays are just n-dimensional generalizations of vectors.  They, too, are atmoic objects (what does this mean again?)

```r
# You make a matrix with the command matrix()
# You provide it with a vector of numbers, the number of rows, and whether or not to fill the matrix by row.
matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, byrow = FALSE)
```

```
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6
```

```r
# For an array, you specify dimensions
array(c(1,2,3,4,5,6,7,8), dim = c(2, 2, 2))
```

```
## , , 1
## 
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
## 
## , , 2
## 
##      [,1] [,2]
## [1,]    5    7
## [2,]    6    8
```

---

# Some commands for 2D structures

* `nrow` and `ncol` give the number of columns and rows, respectively
* `rownames()` and `colnames` act like `names`, but for the dimensions
* You can combine 2-D objects with `cbind` and `rbind`


```r
x <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, byrow = FALSE)
y <- matrix(c(7, 8, 9, 10, 11, 12), nrow = 2, byrow = FALSE)
ncol(x)
```

```
## [1] 3
```

```r
rbind(x, y)
```

```
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6
## [3,]    7    9   11
## [4,]    8   10   12
```

---

# Data Frame
The most common way of storing data in R is the data frame.  Under the hood, it's a list of named equal-length vectors.  Since it's 2D, `cbind`, `rbind`, `colnames`, `rownames`, `ncol`, and `nrow` work on it. To make a data frame, you use the `data.frame()` command

```r
df <- data.frame(x = seq(1, 3), y = c("a", "b", "c"), z = c(T, F, F))
df
```

```
##   x y     z
## 1 1 a  TRUE
## 2 2 b FALSE
## 3 3 c FALSE
```

Are data frames atomic structures?

---

# Accessing things in data frames


```r
df <- data.frame(x = seq(1, 3), y = c("a", "b", "c"), z = c(T, F, F))

# Get variables with $
df$x
```

```
## [1] 1 2 3
```

```r
# Get variables with [[]].  This returns a vector.
df[["x"]]
```

```
## [1] 1 2 3
```

```r
# Get variables with [].  This returns a data frame
df["x"]
```

```
##   x
## 1 1
## 2 2
## 3 3
```

---

# Accessing specific elements in a data frame
To access a specific element in a data frame, use `[]`

```r
df <- data.frame(x = seq(1, 3), y = c("a", "b", "c"), z = c(T, F, F))
df[3, 3]
```

```
## [1] FALSE
```

```r
df[2, "z"]
```

```
## [1] FALSE
```

---

# Adding columns to data frames


```r
df <- data.frame(x = seq(1, 3), y = c("a", "b", "c"), z = c(T, F, F))
df
```

```
##   x y     z
## 1 1 a  TRUE
## 2 2 b FALSE
## 3 3 c FALSE
```

```r
# Use $ or [] to write or overwrite a column in a data frame
df$w <- seq(4, 6)
df["x"] <- c("one", "two", "three")
df
```

```
##       x y     z w
## 1   one a  TRUE 4
## 2   two b FALSE 5
## 3 three c FALSE 6
```










