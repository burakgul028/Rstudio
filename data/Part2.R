library(tidyverse)

#PART 2

stringr::words
worddata<-words

#STEP 1 Take a sample of 100 words from this data, and save this sample as a new data

length(worddata)

#seed my student number section
set.seed(2016556028)

#We randomly select 100 samples from 980 words.
worddata<-worddata[sample((1:980), 100,,)]
worddata


#STEP 2 Find words which are starting with “a” and ending with “e”.
  

findwords<-worddata[str_detect(worddata, "^a")]
findwords[str_detect(findwords, "e$")]

#STEP 3 Calculate the number of words which have more than 3 vowels.

df <- tibble(
  word = worddata,
  i = seq_along(word)
)
df %>%
  mutate(
    vowels = str_count(word, "[aeiou]"))%>%
  filter(vowels>2)%>%
  arrange(desc(vowels))

#STEP 4 List the five longest word in your data.

df1 <- tibble(
  word = worddata,
  i = seq_along(word)
)
df1 %>%
  mutate(
    vowels = str_count(word, "[aeiou]"),
    consonants = str_count(word, "[^aeiou]"),
    numberofletters = (vowels + consonants)
    )%>%
      arrange(desc(numberofletters)) %>%
      select(word,numberofletters)%>%
      head(5)

#STEP 5 Try to find word(s) which contain any of these words: age, any, day, exp, her, pro, the.

worddata[str_detect(worddata,"age")]
worddata[str_detect(worddata,"any")]
worddata[str_detect(worddata,"day")]
worddata[str_detect(worddata,"exp")]
worddata[str_detect(worddata,"her")]
worddata[str_detect(worddata,"pro")]
worddata[str_detect(worddata,"the")]


