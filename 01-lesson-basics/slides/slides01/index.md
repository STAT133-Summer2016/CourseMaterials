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

# Logical Symbols
In this table, `a` and `b` are numerical vectors.  `p` and `q` are logical values (`TRUE` or `FALSE`).  Unless otherwise stated, the operations are vectorized.

Symbol | Usage      | Meaning 
------ | ---------- | -------------------------------------
`==`   | `a == b`   | Does `a` equal `b`?
`<=`   | `a <= b`   | Is `a` less than or equal to `b`?
`>=`   | `a >= b`   | Is `a` greater than or equal to `b`?
`<`    | `a < b`    | Is `a` less than `b`?
`>`    | `a > b`    | Is `a` greater than `b`?
`!`    | `!p`       | Returns negation of `p`
&#124; | p &#124; q | `p` OR `q`
`&`    | `p & q`    | `p` AND `q`
&#124;&#124;  | p &#124;&#124; q   | `p` OR `q` (first element only)
`&&`   | `p && q`   | `p` AND `q` (first element only)
`xor`  | `xor(p, q)`| `p` XOR `q` (exclusive or)
`%in%` | `a %in% b` | Is `a` in `b`?

---

# Logical Checks

Say you have a logical vector, `x`, then there are some special checks you can do with that vector:

Function Call | Meaning
------------- | ------------------------------------
`any(x)`      | Is at least one element of `x` `TRUE`?
`all(x)`      | Are all values of `x` `TRUE`?

Strategy: Sometimes the complements of these are useful. `!any(x)` would mean "are all the elements of `x` `FALSE`?"

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
sum, mean, median, max, min, summary, seq
```

---

# Seq
`seq` creates a sequence of numbers

```r
seq(from = 1, to = 6, by = 2) # sequence from 1 to 6 by 2
```

```
## [1] 1 3 5
```

```r
seq(1, 6, 2) # not necessary to type out the argument names
```

```
## [1] 1 3 5
```

```r
seq(1, 6) # by default, by is 1
```

```
## [1] 1 2 3 4 5 6
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
x <- c(13, 6, 18, 2, 11)
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

# unique
`unique` returns the unique values in a vector

```r
x <- c(1, 1, 1, 2, 2, 3)
unique(x)
```

```
## [1] 1 2 3
```

---

# any and all
`any` is a way to check if _any_ values of a logical vector are `TRUE`
`all` checks if _all_ values of a logical vector are `TRUE`

```r
x <- c(1, 100, 1000, 10000, 100000)
any(x > 10^6)
```

```
## [1] FALSE
```

```r
all(x <= 10^5)
```

```
## [1] TRUE
```

---

# in
`%in%` is a special _infix_ operator (it goes between its arguments like a `+` sign) that checks to see if some values are in a set

```r
# Are the values of x in y?
x <- c(1, 2, 10)
y <- seq(1, 5)

x %in% y
```

```
## [1]  TRUE  TRUE FALSE
```

---

# table
`table` counts the number of occurences of each value in a vector

```r
x <- c(1, 1, 1, 2, 2, 3)
table(x)
```

```
## x
## 1 2 3 
## 3 2 1
```

```r
y <- c("a", "a", "b", "b", "b", "c")
table(y)
```

```
## y
## a b c 
## 2 3 1
```
