install.packages("tidyverse")
library(tidyverse)

starwars <- dplyr::starwars

#Burak Gul - 2016556028

#1st How many unique species per their homeworld are there?

starwars %>%
  group_by(homeworld) %>%
  summarise(
    species = unique(species),
    n=n(),
  ) %>%
  filter(n>1)



#2nd Which character(s) did play in the Star Wars movies most?

starwars %>% 
  mutate(movies_count = sapply(films, length)) %>% 
  arrange(desc(movies_count)) %>% 
  select(name, movies_count)



#3rd average height value and the average mass value across each species?

starwars %>%
  group_by(species) %>%
  summarise(
    species = unique(species),
    n = n(),
    mean_height = mean(height, na.rm = TRUE), 
    mean_mass = mean(mass, na.rm = TRUE))



#4th Create a new data set, new one or more rows add,  

newdata_starwars<-starwars    #create new dataset


starwars2 <- data.frame(
  name = c("burak","berkay"),
  height = c(173,158),
  mass = c(65,58),
  hair_color = c('black','blond'),
  skin_color = c('gold','white'),
  eye_color = c('brown','blue'),
  birth_year = c(22,14),
  sex = c('male','male'),
  gender = c('masculine','masculine'),
  homeworld = c('Stewjon','Tatooine'),
  species = c('human','human'),
  films = c('Return of the Jedi','The Phantom Menace'),
  vehicles = c('Snowspeeder','Flitknot speeder'),
  starships = c('Millennium Falcon','A-wing'))


newdata_starwars <- rbind(newdata_starwars, starwars2)

print(newdata_starwars) #new dataset view     



#5th Calculate the body mass index (BMI) After, select BMI and some variables

newdata_starwars <- mutate(newdata_starwars,
                           HeightInMeters = (height*.01),
                           BMI = (mass / HeightInMeters^2))
newdata_starwars %>%
  select(name, BMI, mass, species, hair_color, skin_color, eye_color, sex, gender)




#6th using this new dataset, categorize the observations and Find the counts of these categories

cat_bmi<-newdata_starwars %>%
  mutate(categories=cut(BMI,breaks=c(-Inf,18.5,25,30,Inf),labels=c("underweight","healthy","overweight","obese"))) %>%
  select(species,categories)

gather(cat_bmi,species,categories) %>%
  count(species,categories) %>%
  spread(categories,n,fill=0)



#7th 


# to draw boxplot

ggplot(data= newdata_starwars, mapping =  aes(x=gender, y=BMI, fill=sex)) + 
  geom_boxplot()+
  facet_wrap(~gender, scale="free")

# I think the box chart below is more understandable.

ggplot(data= newdata_starwars, mapping =  aes(x=sex, y=BMI, fill=gender)) + 
  geom_boxplot()+
  facet_wrap(~sex, scale="free")
