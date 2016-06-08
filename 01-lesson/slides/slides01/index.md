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

# Naming Objects

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

There are some rules for naming objects in R:

* Names cannot start with a number, so, for example `001graph` would not be valid.
* Names cannot contain punctuation, so `n*mmatrix` is not legitimate.  The only two exceptions are periods `.` and underscores `_`.
* Names are case-sensitive, so `vorpal1` and `Vorpal1` are two different objects

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

---

# Logical Statements
R understands the following logical checks:
```
==, >=, <=, <, >, !=
```
The `==` checks for equality.  Note that it's two equal signs! This is a common mistake.

```r
5 == 2+3
```

```
## [1] TRUE
```

```r
c(1,2) == c(1,5)
```

```
## [1]  TRUE FALSE
```
The `!=` checks for nonequality.  Usually the `!` in programming denotes negation.

```r
4 != 2+3
```

```
## [1] TRUE
```
Another thing to note is that R performs these checks element-by-element for vectors.

```r
c(1, 2, 3, 4, 5) <= 3
```

```
## [1]  TRUE  TRUE  TRUE FALSE FALSE
```

---

# Combining Logical Statements
To combine logical statements together, we use `&` for the logical `AND` and `|` for the logical `OR`.


```r
x <- 5
3 < x & x < 7
```

```
## [1] TRUE
```

```r
# 3 < x < 7 doesn't work!
```

---

# Subsetting in R

You can pick out certain elements of a vector using square brackets

```r
x <- c(1, 3, 5, 7, 9)
x[2]
```

```
## [1] 3
```

```r
x[c(1, 3, 5)]
```

```
## [1] 1 5 9
```

```r
x[c(TRUE, FALSE, FALSE, FALSE, TRUE)]
```

```
## [1] 1 9
```

---

# Some useful functions in R

`length` gives you the number of elements in a vector

```r
x <- c(1, 2, 3, 3, 3)
length(x)
```

```
## [1] 5
```

I won't go over these functions explicitly during lecture, but they should be helpful for you in your lab and homework.

```
sum, mean, median, max, min, summary, seq, which, which.max, which.min
```

---

# Sort
`sort` sorts the values of a vector in increasing order

```r
x <- c(13, 6, 18, 2, 11)
sort(x)
```

```
## [1]  2  6 11 13 18
```

```r
sort(x, decreasing = TRUE) # can specify decreasing
```

```
## [1] 18 13 11  6  2
```

---

# Order

`order` gives the _indices_ (positions) of the values in increasing order

```r
order(x)
```

```
## [1] 4 2 5 1 3
```

```r
order(x, decreasing = TRUE)
```

```
## [1] 3 1 5 2 4
```

---

# Head and Tail

`head` gives the first few elements while `tail` gives the last few elements

```r
x <- c(1, 2, 3, 4, 5)
head(x, 2) # gives the first two elements
```

```
## [1] 1 2
```

```r
tail(x, 3) # gives the last three elements
```

```
## [1] 3 4 5
```

---

# which
`which` gives the _indices_ (positions) that are `TRUE` for a given logical vector

```r
which(c(TRUE, TRUE, FALSE, TRUE, FALSE))
```

```
## [1] 1 2 4
```

```r
x <- c(1, 2, 3, 4, 5)
which(x <= 3)
```

```
## [1] 1 2 3
```
`which.max` and `which.min` returns the index of the FIRST value that satisfies maximality or minimality

```r
x <- c(5, 5, 5, 3, 2)
which.max(x)
```

```
## [1] 1
```


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





