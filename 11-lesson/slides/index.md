---
title       : Lesson 11
subtitle    : Time data
author      : Andrew Do
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Packages and Locale



### You will need to install the following packages if you haven't:

* `lubridate`

### Locale problems.  

If your computer is not natively run on English, you may have to fun the following commands or else it might not recognize things like "Jan" as "January".


```r
Sys.setlocale("LC_ALL", "en")
Sys.setenv("LANGUAGE" = "en")
```

---

## Riddle me that

### When does a day not equal 24 hours?

### When does a year not equal 365 days?

### When does a minute not equal 60 seconds?

---

## Formalizing Time

Time is deceptively rather difficult to work with.  In the `lubridate` package, we formalize 4 notions of time:

1. Instants
2. Periods
3. Durations
4. Intervals

---

## Instants

### An instant is a specific moment of time

### Instants are a combination of years, months, days, hours, minutes, seconds, and time zone.

### e.g, 2011-03-28 08:44:32 CST

---

## Strings into instants

To turn a `string` into an instant, use y, m, d, h, m, and s in the correct order to specify the order of year, month, day, hour, minutes, and seconds in the string.  For example


```r
ymd("2011-03-28")
mdy("03/28/2011")
dmy("28032011")
ymd_hms("2011:03:28 08:50:30")

#order matters
dmy("05-03-2011")
mdy("05-03-2011")
```

---

## Data Type

Time objects have a class of their own defined within `lubridate`


```r
time_string <- "2011-03-28"
class(time_string)
```

```
## [1] "character"
```

```r
time_lubridated <- ymd(time_string)
class(time_lubridated)
```

```
## [1] "Date"
```

---

## Manipulating Time

You can write logical statements and do arithmetic with time:


```r
# Comparisons
today() > ymd("2016-03-29")

# Round
floor_date(now(), "month")
ceiling_date(now(), "month")
round_date(now(), "month")

# Extract
year(today())
month(ymd("2016-03-29"))
wday(ymd("2016-06-23"))
```

---

## Extracting Information

Date Component | Extractor
-------------- | ------------------------------------------------
Year           | year()
Month          | month()
Week           | week()
Day            | day()
Day of year    | yday()
Day of month   | mday()
Day of week    | wday()
Hour           | hour()
Minute         | minute()
Second         | second()
Time Zone      | tz()

---

## Try these commands


```r
now()
```

```
## [1] "2016-06-23 09:22:28 PDT"
```

```r
year(now())
```

```
## [1] 2016
```

```r
hour(now())
```

```
## [1] 9
```

```r
day(now())
```

```
## [1] 23
```

```r
yday(now())
```

```
## [1] 175
```

```r
wday(now())
```

```
## [1] 5
```

```r
wday(now(), label = TRUE)
```

```
## [1] Thurs
## Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat
```

```r
wday(now(), label = TRUE, abbr = FALSE)
```

```
## [1] Thursday
## 7 Levels: Sunday < Monday < Tuesday < Wednesday < Thursday < ... < Saturday
```

```r
month(now(), label = TRUE, abbr = FALSE)
```

```
## [1] June
## 12 Levels: January < February < March < April < May < June < ... < December
```

```r
# Which day of the week were you born?
```

---

## Can use the extractors to change components of a `Date` object


```r
time <- now()
time
```

```
## [1] "2016-06-23 09:22:28 PDT"
```

```r
year(time) <- 2000
hour(time) <- 23
day(time) <- 45

tz(time) <- "UTC"
time
```

```
## [1] "2000-07-15 23:22:28 UTC"
```

---

## Your turn

## What day of the week will your birthday be in 2017?

---

## Time Spans

Suppose we want to set our alarms on `R`


```r
ymd_hms("2011-01-01 08:30:00", tz = "") + ddays(0:30)
```

How about


```r
ymd_hms("2011-03-01 08:30:00", tz = "") + ddays(0:30)
```

---

## 3 Types of Time Spans

### Durations represent exact time lengths

### Periods represent clock time lengths

### Intervals represent specific times

---

## Durations

### Durations measure the exact amount of seconds that pass through two time points.

### Use d + the plural of a unit of time to create a duration

* dyears(x) - number of seconds in x 365 day-years
* dminutes(x) - number of seconds in x 60 second minutes
* dhours(x) - can you guess?
* dmonths? - can this exist?

---

## Try it


```r
dhours(2)
now() + dhours(2)

dminutes(5)
now() + dminutes(c(5,10,15))
```

---

## Periods

### Periods measure time spans in units larger than seconds.  Periods can be thought of as "clock time" 

### Use the plural of a unit of time to create a period

---

## Try it


```r
minutes(10)
hours(278)

now() + years(1:10)
```

---

## Periods vs. Durations

### Periods are intuitive time

### Durations give exact times (good for science)

---

## Intervals

### Intervals measure a time span by recording its endpoints.  Since we known when a time span occurs, we can calculate lengths with all units (can adjust for leap years, daylight savings, etc)

To create an interval, use the special `%--%` operator.

```r
int <- ymd("2010-01-01") %--% ymd("2009-01-01")
```

Access and set the endpoints with `int_start()` and `int_end()`

```r
int_start(int)
int_end(int) <- ymd("2010-03-14")
```

Intervals can be accurately converted to either periods or durations with as.period() and as.duration()

---

## Math with Intervals


```r
birthday <- Your_birthday
life <- birthday %--% now()
life / ddays(1)
life / days(1)
life %/% days(1)
```

---

## Your Turn

### Calculate your birthday in minutes, hours, days.

---

## Useful Interal functions

* `%within%` checks if a moment is in an interval
* `int_overlaps` checks if two intervals overlap
* `setdiff` returns any overlaps in the intervals
