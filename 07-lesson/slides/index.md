---
title       : Lesson 7
subtitle    : Loops
author      : Andrew Do
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## Repeated Actions

Say you wanted to repeat an action over and over again, maybe with some slight changes.  For example, you might want your computer to sing _99 Bottles of Beer_:

```r
print("99 bottles of beer on the wall.")
```

```
## [1] "99 bottles of beer on the wall."
```

```r
print("99 bottles of beer!")
```

```
## [1] "99 bottles of beer!"
```

```r
print("Take one down, pass it around.")
```

```
## [1] "Take one down, pass it around."
```

```r
print("98 bottles of beer on the wall!")
```

```
## [1] "98 bottles of beer on the wall!"
```

---

## Looping

Now you could type out the 396 lines of the song by hand or you could have your computer do what's called a loop.

```r
for (n in 99:1) {
  print(str_c(n, " bottles of beer on the wall."))
  print(str_c(n, " bottles of beer!"))
  print("Take one down, pass it around.")
  print(str_c(n-1, " bottles of beer on the wall!"))
}
```

```
## [1] "99 bottles of beer on the wall."
## [1] "99 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "98 bottles of beer on the wall!"
## [1] "98 bottles of beer on the wall."
## [1] "98 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "97 bottles of beer on the wall!"
## [1] "97 bottles of beer on the wall."
## [1] "97 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "96 bottles of beer on the wall!"
## [1] "96 bottles of beer on the wall."
## [1] "96 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "95 bottles of beer on the wall!"
## [1] "95 bottles of beer on the wall."
## [1] "95 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "94 bottles of beer on the wall!"
## [1] "94 bottles of beer on the wall."
## [1] "94 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "93 bottles of beer on the wall!"
## [1] "93 bottles of beer on the wall."
## [1] "93 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "92 bottles of beer on the wall!"
## [1] "92 bottles of beer on the wall."
## [1] "92 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "91 bottles of beer on the wall!"
## [1] "91 bottles of beer on the wall."
## [1] "91 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "90 bottles of beer on the wall!"
## [1] "90 bottles of beer on the wall."
## [1] "90 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "89 bottles of beer on the wall!"
## [1] "89 bottles of beer on the wall."
## [1] "89 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "88 bottles of beer on the wall!"
## [1] "88 bottles of beer on the wall."
## [1] "88 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "87 bottles of beer on the wall!"
## [1] "87 bottles of beer on the wall."
## [1] "87 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "86 bottles of beer on the wall!"
## [1] "86 bottles of beer on the wall."
## [1] "86 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "85 bottles of beer on the wall!"
## [1] "85 bottles of beer on the wall."
## [1] "85 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "84 bottles of beer on the wall!"
## [1] "84 bottles of beer on the wall."
## [1] "84 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "83 bottles of beer on the wall!"
## [1] "83 bottles of beer on the wall."
## [1] "83 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "82 bottles of beer on the wall!"
## [1] "82 bottles of beer on the wall."
## [1] "82 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "81 bottles of beer on the wall!"
## [1] "81 bottles of beer on the wall."
## [1] "81 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "80 bottles of beer on the wall!"
## [1] "80 bottles of beer on the wall."
## [1] "80 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "79 bottles of beer on the wall!"
## [1] "79 bottles of beer on the wall."
## [1] "79 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "78 bottles of beer on the wall!"
## [1] "78 bottles of beer on the wall."
## [1] "78 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "77 bottles of beer on the wall!"
## [1] "77 bottles of beer on the wall."
## [1] "77 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "76 bottles of beer on the wall!"
## [1] "76 bottles of beer on the wall."
## [1] "76 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "75 bottles of beer on the wall!"
## [1] "75 bottles of beer on the wall."
## [1] "75 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "74 bottles of beer on the wall!"
## [1] "74 bottles of beer on the wall."
## [1] "74 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "73 bottles of beer on the wall!"
## [1] "73 bottles of beer on the wall."
## [1] "73 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "72 bottles of beer on the wall!"
## [1] "72 bottles of beer on the wall."
## [1] "72 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "71 bottles of beer on the wall!"
## [1] "71 bottles of beer on the wall."
## [1] "71 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "70 bottles of beer on the wall!"
## [1] "70 bottles of beer on the wall."
## [1] "70 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "69 bottles of beer on the wall!"
## [1] "69 bottles of beer on the wall."
## [1] "69 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "68 bottles of beer on the wall!"
## [1] "68 bottles of beer on the wall."
## [1] "68 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "67 bottles of beer on the wall!"
## [1] "67 bottles of beer on the wall."
## [1] "67 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "66 bottles of beer on the wall!"
## [1] "66 bottles of beer on the wall."
## [1] "66 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "65 bottles of beer on the wall!"
## [1] "65 bottles of beer on the wall."
## [1] "65 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "64 bottles of beer on the wall!"
## [1] "64 bottles of beer on the wall."
## [1] "64 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "63 bottles of beer on the wall!"
## [1] "63 bottles of beer on the wall."
## [1] "63 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "62 bottles of beer on the wall!"
## [1] "62 bottles of beer on the wall."
## [1] "62 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "61 bottles of beer on the wall!"
## [1] "61 bottles of beer on the wall."
## [1] "61 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "60 bottles of beer on the wall!"
## [1] "60 bottles of beer on the wall."
## [1] "60 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "59 bottles of beer on the wall!"
## [1] "59 bottles of beer on the wall."
## [1] "59 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "58 bottles of beer on the wall!"
## [1] "58 bottles of beer on the wall."
## [1] "58 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "57 bottles of beer on the wall!"
## [1] "57 bottles of beer on the wall."
## [1] "57 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "56 bottles of beer on the wall!"
## [1] "56 bottles of beer on the wall."
## [1] "56 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "55 bottles of beer on the wall!"
## [1] "55 bottles of beer on the wall."
## [1] "55 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "54 bottles of beer on the wall!"
## [1] "54 bottles of beer on the wall."
## [1] "54 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "53 bottles of beer on the wall!"
## [1] "53 bottles of beer on the wall."
## [1] "53 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "52 bottles of beer on the wall!"
## [1] "52 bottles of beer on the wall."
## [1] "52 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "51 bottles of beer on the wall!"
## [1] "51 bottles of beer on the wall."
## [1] "51 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "50 bottles of beer on the wall!"
## [1] "50 bottles of beer on the wall."
## [1] "50 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "49 bottles of beer on the wall!"
## [1] "49 bottles of beer on the wall."
## [1] "49 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "48 bottles of beer on the wall!"
## [1] "48 bottles of beer on the wall."
## [1] "48 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "47 bottles of beer on the wall!"
## [1] "47 bottles of beer on the wall."
## [1] "47 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "46 bottles of beer on the wall!"
## [1] "46 bottles of beer on the wall."
## [1] "46 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "45 bottles of beer on the wall!"
## [1] "45 bottles of beer on the wall."
## [1] "45 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "44 bottles of beer on the wall!"
## [1] "44 bottles of beer on the wall."
## [1] "44 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "43 bottles of beer on the wall!"
## [1] "43 bottles of beer on the wall."
## [1] "43 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "42 bottles of beer on the wall!"
## [1] "42 bottles of beer on the wall."
## [1] "42 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "41 bottles of beer on the wall!"
## [1] "41 bottles of beer on the wall."
## [1] "41 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "40 bottles of beer on the wall!"
## [1] "40 bottles of beer on the wall."
## [1] "40 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "39 bottles of beer on the wall!"
## [1] "39 bottles of beer on the wall."
## [1] "39 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "38 bottles of beer on the wall!"
## [1] "38 bottles of beer on the wall."
## [1] "38 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "37 bottles of beer on the wall!"
## [1] "37 bottles of beer on the wall."
## [1] "37 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "36 bottles of beer on the wall!"
## [1] "36 bottles of beer on the wall."
## [1] "36 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "35 bottles of beer on the wall!"
## [1] "35 bottles of beer on the wall."
## [1] "35 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "34 bottles of beer on the wall!"
## [1] "34 bottles of beer on the wall."
## [1] "34 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "33 bottles of beer on the wall!"
## [1] "33 bottles of beer on the wall."
## [1] "33 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "32 bottles of beer on the wall!"
## [1] "32 bottles of beer on the wall."
## [1] "32 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "31 bottles of beer on the wall!"
## [1] "31 bottles of beer on the wall."
## [1] "31 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "30 bottles of beer on the wall!"
## [1] "30 bottles of beer on the wall."
## [1] "30 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "29 bottles of beer on the wall!"
## [1] "29 bottles of beer on the wall."
## [1] "29 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "28 bottles of beer on the wall!"
## [1] "28 bottles of beer on the wall."
## [1] "28 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "27 bottles of beer on the wall!"
## [1] "27 bottles of beer on the wall."
## [1] "27 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "26 bottles of beer on the wall!"
## [1] "26 bottles of beer on the wall."
## [1] "26 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "25 bottles of beer on the wall!"
## [1] "25 bottles of beer on the wall."
## [1] "25 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "24 bottles of beer on the wall!"
## [1] "24 bottles of beer on the wall."
## [1] "24 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "23 bottles of beer on the wall!"
## [1] "23 bottles of beer on the wall."
## [1] "23 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "22 bottles of beer on the wall!"
## [1] "22 bottles of beer on the wall."
## [1] "22 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "21 bottles of beer on the wall!"
## [1] "21 bottles of beer on the wall."
## [1] "21 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "20 bottles of beer on the wall!"
## [1] "20 bottles of beer on the wall."
## [1] "20 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "19 bottles of beer on the wall!"
## [1] "19 bottles of beer on the wall."
## [1] "19 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "18 bottles of beer on the wall!"
## [1] "18 bottles of beer on the wall."
## [1] "18 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "17 bottles of beer on the wall!"
## [1] "17 bottles of beer on the wall."
## [1] "17 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "16 bottles of beer on the wall!"
## [1] "16 bottles of beer on the wall."
## [1] "16 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "15 bottles of beer on the wall!"
## [1] "15 bottles of beer on the wall."
## [1] "15 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "14 bottles of beer on the wall!"
## [1] "14 bottles of beer on the wall."
## [1] "14 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "13 bottles of beer on the wall!"
## [1] "13 bottles of beer on the wall."
## [1] "13 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "12 bottles of beer on the wall!"
## [1] "12 bottles of beer on the wall."
## [1] "12 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "11 bottles of beer on the wall!"
## [1] "11 bottles of beer on the wall."
## [1] "11 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "10 bottles of beer on the wall!"
## [1] "10 bottles of beer on the wall."
## [1] "10 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "9 bottles of beer on the wall!"
## [1] "9 bottles of beer on the wall."
## [1] "9 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "8 bottles of beer on the wall!"
## [1] "8 bottles of beer on the wall."
## [1] "8 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "7 bottles of beer on the wall!"
## [1] "7 bottles of beer on the wall."
## [1] "7 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "6 bottles of beer on the wall!"
## [1] "6 bottles of beer on the wall."
## [1] "6 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "5 bottles of beer on the wall!"
## [1] "5 bottles of beer on the wall."
## [1] "5 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "4 bottles of beer on the wall!"
## [1] "4 bottles of beer on the wall."
## [1] "4 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "3 bottles of beer on the wall!"
## [1] "3 bottles of beer on the wall."
## [1] "3 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "2 bottles of beer on the wall!"
## [1] "2 bottles of beer on the wall."
## [1] "2 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "1 bottles of beer on the wall!"
## [1] "1 bottles of beer on the wall."
## [1] "1 bottles of beer!"
## [1] "Take one down, pass it around."
## [1] "0 bottles of beer on the wall!"
```

---

## For loops

There are three main types of loops in R: repeat loops, while loops, and for loops.  We will only talk about the last two.  A for loop executes a set of actions over an index set.  So, in the example below, the for loop continually adds one to the numbers in the set `c(1,2,3)` sequentially, and then prints out the result.


```r
for (i in 1:3) {
  print(i + 1)
}
```

```
## [1] 2
## [1] 3
## [1] 4
```

---

## Common Uses

One common use is for the index set to be a set of indices of an object:

```r
v <- c(3, 5, rep(0, 8))

# This code will modify the third through fifth elements of v

for (i in 3:10) {
  v[i] <- v[i-2] + v[i-1]
}
v
```

```
##  [1]   3   5   8  13  21  34  55  89 144 233
```
Note that the `i` is used to call on elements of `v`.  It's never used for its face value.

---

## Common uses

Of course the for loop isn't just constrained to looping over indices.  It can in fact loop over any set.  In the example below, it loops over a character vector:


```r
x <- data.frame(first_column = 1:3, second_column = c("a", "b", "c"), third_column = 7:9)
names(x)
```

```
## [1] "first_column"  "second_column" "third_column"
```

```r
for (name in names(x)) {
  print(x[[name]])
}
```

```
## [1] 1 2 3
## [1] a b c
## Levels: a b c
## [1] 7 8 9
```

---

## While Loops

A while loop repeats a set of actions until its stop condition is met.  In the example below, the loop repeatedly divides by 2 until it hits an odd number.  The stop condition would be hitting the odd number.


```r
# Start off with some value
n <- 748192
i <- 0
# The stop condition is the negation of the statement in the parentheses
while (n %% 2 == 0) {
  n <- n/2
  i <- i + 1 # this i is being used as a counter for verification
}

print(c(n = n, i = i, verification = 2^i * n))
```

```
##            n            i verification 
##        23381            5       748192
```

---

## Initializing Values
Notice that it's often the case that you have some initial value for the loop.  Otherwise the object that you want to change using a loop wouldn't actually exist!  This applies to both for and while loops. 


```r
# Count the number of times you can subtract 5 from a number n before it's less than 5
HowManyFives <- function(n) {
  counter <- 0 # Initialize a counter
  while (n >= 5) {
    n <- n - 5 # update the value of n
    counter <- counter + 1 # update the counter
  }
  return(counter)
}
```

---

## When to use each type of loop

The general idea is as follows: use for loops for when

* You have a finite number of repetitions
* You know the set you want to loop over (e.g. the indices of a vector)
* You want to definitely loop over everything in that set

Use while loops when:

* You don't know how many times you want to repeat something
* You'll know when to stop "when you see it" (stopping condition)

---

## Let's Write Some Loops

Using a loop, write a function that will replace all the `99` values in odd columns of a data frame with NA.

First, let's break down the problem into digestable bits:

* We need to know the number of columns (`ncol`)
* We'll need to only have the odd columns (`seq` or `%%`)
* We'll loop over the set of odd columns (`for (i in set)`)

