library(tidyverse)

# Question 1 - Find prime number

# We take sample 10 numbers between 1 and 1000.
numdata = c(1:1000)
set.seed(2016556028)
numdata <- numdata[sample((1:1000), 10,,)]
numdata

#function that finds a prime number(s) given a set of numbers
findprime <- function(df) {
  
  is.prime <- function(num) {
    
    if (num == 2) {
      TRUE
    } else if (any(num %% 2:(num-1) == 0)) {
      FALSE
    } else { 
      TRUE
    }
    
  }
  
  output <- vector("double", length(df))
  
  for (i in seq_along(df)) {
    output[i] <- is.prime(df[[i]])
  }
  
  output
  
}
#end of function

#run function

findprime(numdata)

#print numbers
numdata

#---------------------------------------------------
# Question 2 - Sorting words by alphabet and number of letters.

stringr::sentences

worddata<-sentences

#Select 5 sentences randomly from Sentences.

set.seed(2016556028)
worddata<-worddata[sample((1:720), 5,,)]
worddata

#Sort the words containing the same number of letters alphabetically.

sortedword<-function(df){
  
  #Combining sentences, dividing into words and clearing dots.
  
  df<- str_c(df, collapse = " ")
  
  df<-str_split(df, boundary("word"))[[1]]
  
  df<-str_sort(df, locale = "en")
  
  #Finding and sorting the number of letters.
  
  df1 <- tibble(
    word = df,
    i = seq_along(word)
  )
  df1<-df1 %>%
    mutate(
      vowels = str_count(word, "[aeiou]"),
      consonants = str_count(word, "[^aeiou]"),
      numberofletters = (vowels + consonants)
    )%>%
    arrange(numberofletters) %>%
    select(word,numberofletters)
  
  #Making words single paragraphs and lowercase letters.
  
  df<- str_c(df1$word, collapse = " ")
  df <-lapply(df, tolower)
  
  df
  
}
#end of function

#run function

sortedword(worddata)
