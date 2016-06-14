---
title       : Lesson 4
subtitle    : Strings and Factors in R
author      : Andrew Do
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Office Hours
Office hours will be held in the classroom.  Evans 342

Person      | Time
----------- | -------
Andrew      | M 10-12
Cindy       | T 11-1
Andrew      | W 11-1
Cindy       | Th 11-1

---

## Strings

We can express strings using single or double quotes:


```r
# Single quotes
'this is a string'
```

```
## [1] "this is a string"
```

```r
# Double quotes
"this is also a string"
```

```
## [1] "this is also a string"
```

---

## Quotes inside strings
Single quotes can only be used in double-quote strings and vice versa.


```r
# Can do
"The little bird chirped 'hello' cheerfully."
```

```
## [1] "The little bird chirped 'hello' cheerfully."
```

```r
# No can do
# 'This won't work'
```

---

## Empty String

You can create an __empty string__ with two consecutive quotation marks.


```r
empty_str <- ""
empty_str
```

```
## [1] ""
```

---

## Character vectors

You can, of course, create vectors of strings


```r
x <- c("this is a vector")
x
```

```
## [1] "this is a vector"
```

```r
y <- c("this", "is", "a", "vector")
y
```

```
## [1] "this"   "is"     "a"      "vector"
```

---

## Recycling Rule
R tries to be nice to you if you don't specify equal numbers of arguments to functions that need them.

It will "recycle" shorter vectors until it reaches the right length so long as the longer vector is a multiple of the shorter one.


```r
# Recycling at work
c(1,2) + c(1,2,3,4)
```

```
## [1] 2 4 4 6
```

```r
1:3 / 1:6
```

```
## [1] 1.00 1.00 1.00 0.25 0.40 0.50
```

---

## Invalid Lengths

You should avoid using the recycling rule if you aren't sure how the operation will extend the shorter vector.


```r
# This "works" but is not recommended
c(1,2) + c(1,2,3,4,5)
```

```
## Warning in c(1, 2) + c(1, 2, 3, 4, 5): longer object length is not a
## multiple of shorter object length
```

```
## [1] 2 4 4 6 6
```

---

## paste

`paste()` is one of the most important tools for string manipulation.  

```
paste(..., sep = " ", collapse = NULL)
```

It takes one or more vectors, coerces them into the `character` type, and "pastes" them together.

---

## Examples

Simple example

```r
paste("The life of", pi)
```

```
## [1] "The life of 3.14159265358979"
```

Vectorized example

```r
paste("Hello, my name is", c("Andrew", "Bob", "Chris"))
```

```
## [1] "Hello, my name is Andrew" "Hello, my name is Bob"   
## [3] "Hello, my name is Chris"
```

---

## sep
To change what goes in between elements to be pasted, we use the `sep` argument.  The default __separator__ is a blank space (`sep = " "`).

```r
paste("to", "be", "or", "not", "to", "be")
```

```
## [1] "to be or not to be"
```

```r
paste("to", "be", "or", "not", "to", "be", sep = " ")
```

```
## [1] "to be or not to be"
```

```r
paste("to", "be", "or", "not", "to", "be", sep = "-")
```

```
## [1] "to-be-or-not-to-be"
```

---

## collapse
The collapse argument allows us to further paste the pasted strings together.  It's easier to see it in action:

```r
paste("Hello,", c("my", "his", "her"), "name is", c("A", "B", "C"))
```

```
## [1] "Hello, my name is A"  "Hello, his name is B" "Hello, her name is C"
```

```r
paste("Hello,", c("my", "his", "her"), "name is", c("A", "B", "C"), collapse = ".  ")
```

```
## [1] "Hello, my name is A.  Hello, his name is B.  Hello, her name is C"
```

---

## Installing Packages in R
To install a package in R, simply call the command.  The name of the package must be put in as a string
```
install.packages("name_of_package")
```
To get access to the package in an R session, you must use `library`.  If you are using a package in an R Markdown document, you should include this line near the beginning of your document:
```
library(name_of_package)
```

---

## Stringr

`stringr` is an `R` package that provides functions for:

* basic string manipulation
* __regular expression__ operations (more on this later)


```r
library(stringr)
```


---

## Basic `stringr` functions

Function       | Description
-------------- | -------------------------------
str_c          | same usage as paste
str_length     | number of characters
str_sub        | extracts substrings
str_dup        | duplicates characters
str_detect     | detects presence of a pattern
str_locate     | finds first position of pattern
str_replace    | replaces first matched pattern
str_replace_all| replace all matched patterns

---

## str_c

We'll go over some basic uses, but you might want to look up the documentation for the `stringr` package if you want to learn more.  The difference between `str_c` and `paste` is that the default separator for `paste` is the empty string rather than a space


```r
str_c("woe", "is", c("I", "me", "everyone"))
```

```
## [1] "woeisI"        "woeisme"       "woeiseveryone"
```

```r
str_c("woe", "is", c("I", "me", "everyone"), sep = " ")
```

```
## [1] "woe is I"        "woe is me"       "woe is everyone"
```

```r
str_c("woe", "is", c("I", "me", "everyone"), sep = " ", collapse = ". ")
```

```
## [1] "woe is I. woe is me. woe is everyone"
```

---

## str_length
Counting how long a string is.  Note that whitespace counts as a character.

```r
some_text <- c("You are", "two", "I am", NA)
str_length(some_text)
```

```
## [1]  7  3  4 NA
```

--- 

## str_sub
Allows you to extract substrings by location

```r
nonsense <- "Lorem ipsum dolor sit amet"
str_sub(nonsense, start = 1, end = 5)
```

```
## [1] "Lorem"
```
You can use negative indices to start at the back

```r
restaurants <- c("brasserie", "bistrot", "creperie", "bouchon")
str_sub(restaurants, start = -4, end = -1)
```

```
## [1] "erie" "trot" "erie" "chon"
```

---

## Replacing at exact locations
You can use str_sub to replace text at exact locations

```r
lorem <- "Lorem Ipsum"
# One substitution
str_sub(lorem, 1) <- "Nullaming"
lorem
```

```
## [1] "Nullaming"
```

```r
# Multiple substitutions
lorem <- "Lorem Ipsum"
str_sub(lorem, c(1,7), c(5,8)) <- c("Nullam", "Enim")
lorem
```

```
## [1] "Nullam Ipsum"  "Lorem Enimsum"
```

---

## Regular Expressions
[http://regexone.com/](Interactive Tutorial)
