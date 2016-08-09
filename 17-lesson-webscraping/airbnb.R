library(stringr)
library(purrr)
library(rvest)

#------------------------------------------------------------------------------#
# Author: Andrew Do
# Purpose: A bunch of utility functions for the main ScrapeCityToPage The goal
# is to be able to scrape up to a specified page number for a given city and
# then to store that information as a data frame.  The resulting data frame will
# be raw and will require additional cleaning, but the structure is more or less
# what we'll want.
# Copyright: MIT License
# Disclaimer: This code is provided for academic purposes only. I am not
# endorsing scraping the AirBnB website.
#------------------------------------------------------------------------------#

BuildSearchURL <- function(page_number, city, country) {
  # Constructs a URL to an AirBnB search page
  base <- "https://www.airbnb.com/s/"
  place <- str_c(city, country, sep = "--")
  page_number <- str_c("?page=", page_number)
  
  str_c(base, place, page_number)
}

BuildRoomURL <- function(page) {
  # Given a room id, constructs a URL to an AirBnB room URL
  base <- "https://www.airbnb.com"
  room_id <- page %>%
      html_nodes(xpath = '//a[@class="media-photo media-cover"]') %>%
      html_attr("href") %>%
      str_replace("\\?(guests=?[0-9]{0,2})?&?s=.*$", "")
  str_c(base, room_id)
}

GetInfo <- function(room) {
  # Scrapes data off a given room page
  read_html(room) %>% 
  html_nodes(xpath = '//div[@class="col-md-6"]') %>% 
  html_children %>%
  html_text %>%
  str_subset(":")
}

ParseToDF <- function(info) {
  # Converts raw scrape to a data frame
  info %>% 
  map(str_split, ": ") %>% 
  at_depth(2, ~set_names(.[2], .[1])) %>% 
  map_df(flatten)
}

SlowDownBy <- function(time, f) {
  # Function operator that slows down an existing function
  Sys.sleep(time)
  force(f)
  function(...) f(...)
}

ScrapeCityAtPage <- function(page, city, country, delay = 2) {
  # Scrapes a given page of a city search
  BuildSearchURL(page, city, country) %>%
  read_html %>% 
  BuildRoomURL %>% 
  map(SlowDownBy(delay, GetInfo)) %>% 
  ParseToDF
}

ScrapeCityToPage <- function(max_page, ...) {
  # Scrapes up to a page of a city search
  # Arguments:
  #   max_page - integer, last page number to scrape
  #   city - character vector of length 1, city to get information on
  #   country - character vector of legnth 1, country of city
  #   delay - numeric, number of seconds to delay by between each query
  # Returns:
  #   data frame containing information on room pages
  map_df(1:max_page, ScrapeCityAtPage, ...)
}

#------------------------------------------------------------------------------#
# Example usage
#------------------------------------------------------------------------------#

ScrapeCityToPage(2, "Tokyo", "Japan")
ScrapeCityToPage(3, "Paris", "France")
