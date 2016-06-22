---
title       : Lesson 10
subtitle    : Tidy Data
author      : Andrew Do
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---




## Motivation

### How many variables are represented in this table?  What are they?

<img src="img/3var1.png" width="600">

---

## Motivation

### In the language of data wrangling, we convert the table from __wide format__ to __long format__.
<img src="img/3var2.png" width="600">

---

## Tidy Data

### A data set is said to be __tidy__ if:

1. __Observations__ or __cases__ are in the rows
2. __Variables__ are in the columns
3. Everything is contained in a single __dataset__

__Messy data__ is any other arrangement of data.

### Advantages of tidy data:

1. Standard structure allows for standard wrangling and analysis tools
2. Ordering often makes sense
3. Easy to read off individual cases/variables used

---

## Common Problems of Messy Data Sets

### Column headers contain values instead of variable names

### Multiple variables are stored in one column

### Variables stored in both rows and columns

### Multiple types of observational units stored in the same table

### Single observational unit stored in multiple tables

---

## Tidying Verbs

Just like with wrangling, we can formalize a good amount of the most common tidying actions in a few verbs:

Tidying verb | Description
------------ | -------------------------------------------------
gather       | Take columns and collapse into key-value pairs
spread       | Take key-value pair and lay it over multiple columns
separate     | Turn a single character column into multiple columns
unite        | Turn multiple character columns into one

---

## Gather

__Gathering__ the __keys__ `A` and `B` into a single column called `Treatment` and their __values__ into a column `Blood_Pressure`:

```
##   names   A   B
## 1  John 121 166
## 2  Mary 110 145
## 3   Sue 130 141
```


```r
gather(data = df, key = Treatment, value = Blood_Pressure, A, B)
```

```
##   names Treatment Blood_Pressure
## 1  John         A            121
## 2  Mary         A            110
## 3   Sue         A            130
## 4  John         B            166
## 5  Mary         B            145
## 6   Sue         B            141
```

---

## Spread
__Gathering__ the __key-value pair__ `Treatment` and `Blood_Pressure` across multiple columns:

```
##   names Treatment Blood_Pressure
## 1  John         A            121
## 2  Mary         A            110
## 3   Sue         A            130
## 4  John         B            166
## 5  Mary         B            145
## 6   Sue         B            141
```

```r
spread(data = df, key = Treatment, value = Blood_Pressure)
```

```
##   names   A   B
## 1  John 121 166
## 2  Mary 110 145
## 3   Sue 130 141
```

---

## Separate

__Separating__ `x` into `first` and `second`, which were __separated__ by `"."`

```
##      x y
## 1 <NA> 1
## 2  a.b 2
## 3  a.d 3
## 4  b.c 4
```

```r
separate(data = df, col = x, into = c("first", "second"), sep = "\\.")
```

```
##   first second y
## 1  <NA>   <NA> 1
## 2     a      b 2
## 3     a      d 3
## 4     b      c 4
```

---

## Column headers contain values and not variables

### Income distribution within US religious groups

* Survey that examines relationship between income and religious affiliation
* Collected by the Pew Forum on Religious and Public Life [LINK](http://pewforum.org/Income-Distribution-Within-US-Religious-Groups.aspx)
* Data is in the `data` folder for lesson 10


```r
library(readr)
df <- read_tsv("../data/pew.txt")
```

### Discuss:

* What are the variables in this table?
* Is this data tidy? If not, which verb would you use to fix it?

---

## Fixing the data

Using `gather` from `tidyr`, we can fix this data.  Notice that the `-` means "don't gather this column".


```r
longdf <- gather(df, key = income, value = n, -religion)
head(longdf, 5)
```

```
## Source: local data frame [5 x 3]
## 
##             religion income     n
##                <chr>  <chr> <int>
## 1           Agnostic  <$10k    27
## 2            Atheist  <$10k    12
## 3           Buddhist  <$10k    27
## 4           Catholic  <$10k   418
## 5 Don<U+0092>t know/refused  <$10k    15
```

---

## Multiple Variables in One Column

### WHO Tuberculosis study

```r
df <- read_csv("../data/tb.csv") %>%
  select(-new_sp)
names(df) <- str_replace(names(df), "new_sp_", "")
```

### Discuss

* What are the variables in this study? Hint: `f=female` and `1524=15-24`.

---

## You try it

### Tidy up the WHO data set

Some things you might want to think about:
* Gather the appropriate columns (`gather`)
* Separate gender and age into two columns
  - Maybe modify the string so you can use `separate`
* Change `m` and `f` to `male` and `female` (`mutate`)
* Make `age` more readable, e.g. "04" should be "0-4" (`mutate`)

---

## You try it


```r
age_ranges <- c("04" = "0-4", "514" = "5-14", "014" = "0-14",
                "1524" = "15-24", "2534" = "25-34", "3544" = "35-44",
                "4554" = "45-54", "5564" = "55-64", "65" = "65+", 
                "u" = "unknown")
gender_values <- c("m" = "male", "f" = "female")

tidydf <- gather(df, gender, n, -iso2, -year) %>%
  separate(gender, c("gender", "age"), 1) %>% 
  mutate(age = str_replace_all(age, age_ranges),
         gender = str_replace_all(gender, gender_values)) %>%
  na.omit
```

---

## Variables in Row Names and Columns

### Weather data in Cuernavaca, Mexico in 2010

```r
df <- read_tsv("../data/weather.txt")
```

### Inspect the data:

* What are the variables in this data set?
* `tmin` = minimum temperature
* `id` = weather station identifier

Is the data tidy? If not, then what needs to be done?

---

## Your turn

## Tidy up the data.  Discuss with those around you to figure out what needs to be done.

---

## Possible tidying procedure


```r
tidydf <- df %>%
  gather(day, temperature, -id, -year, -month, -element) %>%
  mutate(day = str_replace(day, "d", ""),
         element = str_to_lower(element)) %>%
  select(id, year, month, day, element, temperature) %>%
  mutate(day = as.integer(day),
         temperature = as.numeric(str_replace_all(temperature, "(.*)(.)$", "\\1\\.\\2"))) %>%
  na.omit
```

---

## Multiple Data Types in One Table


```r
df <- read_csv("../data/billboard.csv")
```

### Try it yourself without guidance

---

## Multiple Data Types in One Table


```r
tidydf <- df %>%
  gather(Week, Rank, -year, -artist.inverted, -track, -time, -genre,
         -date.entered, - date.peaked)
```
Do you notice anything undesirable about this "tidy" form?

---

## Multiple Data Types in One Table

Each fact about a song is repeated many many times. Sign that multiple types of
experimental unit stored in the same table. We can store our data more efficiently by separating it into different tables for each type of unit.

Need to separate out into song and rank tables.

---

## Multiple Data Types in One Table


```r
Rankings <- tidydf %>% 
  select(-Week, -Rank, -date.entered, -date.peaked) %>%
  unique %>%
  mutate(Song_ID = row_number())
```

---

## One Data Type in Multiple Tables

## You'll see an example of this in the last problem of the homework.
---

## Further reading

For a complete discussion on tidy data, please read the following paper:

[Tidy Data by Hadley Wickham](http://vita.had.co.nz/papers/tidy-data.pdf)
