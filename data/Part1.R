library(tidyverse)
library(lubridate)

#PART 1 read data 

#I use read_csv2 to transfer in data table form.
data<-read_csv2("data/assignment2_data.csv")
data

#seed my student number section
set.seed(2016556028)

#We randomly select 100 samples from 452 data

data<-data[sample(nrow(data),100),]
data


#STEP 1 Calculate the mean sales’ values for each color.

by_Color<- group_by(data, Color)
Color_Sales_mean <- summarize(by_Color,
                   count = n(),
                   mean_sales = mean(Sales, na.rm = TRUE)
                   
)
Color_Sales_mean 

#STEP 2  Calculate the mean sales’ values for each region.
by_Region<- group_by(data, Region)
Region_Sales_mean <- summarize(by_Region,
                   count = n(),
                   mean_sales = mean(Sales, na.rm = TRUE)
                   
)
Region_Sales_mean

#STEP 3  Identify the five highest sales’ value according to date, color and region separately.
data %>%
  arrange(desc(Sales)) %>% 
  select(Date,Color,Region,Sales)%>%
  head(5)
  

#STEP 4 Identify the month in which the mean sales’ value is the highest.


#We make different types of dates uniform and seperate them into days,month and years.

data$convertdate<-as.Date(data$Date,format = "%d.%b.%y")
data$convertdate<-format(data$convertdate,"%d-%b-%Y")
data$Date[!is.na(data$convertdate)] = data$convertdate[!is.na(data$convertdate)]

#seperate section

data <-data %>%
  separate(Date, into = c("day", "month", "year"), sep = "-")


#calculate section

by_month<- group_by(data, month)
Month_Sales_mean <- summarize(by_month,
                      count = n(),
                      mean_sales = mean(Sales, na.rm = TRUE))

Month_Sales_mean %>%
  arrange(desc(mean_sales)) %>% 
  select(month,mean_sales)

#STEP 5 Plot the sales according to years.

by_year<- group_by(data, year)
Year_Sales_mean <- summarize(by_year,
                      count = n(),
                      mean_sales = mean(Sales, na.rm = TRUE))
Year_Sales_mean


#Plot graphic section

ggplot(data=Year_Sales_mean,mapping = aes(x=year,y=mean_sales,group=1)) +
  geom_path()+
  geom_point(size=3)



