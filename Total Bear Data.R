library(psych)

##import the data set
BB<-read.csv("~/Documents/Black Bear Project/Bear_Data.csv")
attach(BB)
BB
##basic stats for the data of bears since 1957

describe(Female)
describe(Male)
describe(Unknown)
describe(Total)
describe(Percent_Female)



Avg_Unkwn<-mean(Unknown)
##Graphical analysis of data
##female vs. year

plot(Year,
     Female,
     xlab = "Year",
     ylab = "Female Take",
     main = "Female take per year")

##male vs. year

plot(Year,
     Male,
     xlab = "Year",
     ylab = "Male Take",
     main = "Male take per year")

##total vs. year

plot(Year,
     Total,
     xlab = "Year",
     ylab = "Total Bear Take",
     main = "Total Bear Take")

##amount take with the max cap since 2013



##create running limit for female impact
PerMax<-rep(40,60)


##percent female vs. Year

plot(Year,
     Percent_Female,
     xlab = "Year",
     ylab = "Percent Female catch",
     main = "Percent Female take by year",
     lines(Year, PerMax, lty=1, col="red"))

##new adaptation of the percent count with outliers removed in a whole new dataset
##removed years 1975 and 1989 due to no gender data associated with the hunts
##1989 had no hunt, 1975 had no gender data

BBNO<-read.csv("~/Documents/Black Bear Project/Bear_Data_no_Outliers.csv")
PerMax1<-rep(40, 58)

#plot without outliers

plot(BBNO$Year,
     BBNO$Percent_Female,
     xlab = "Year",
     ylab = "Percent Female Take",
     main = "Percent Female Take 1957-2016",
     sub = "Excluding years: 1975, and 1989",
     lines(BBNO$Year, PerMax1, lty=1, col="red"))

