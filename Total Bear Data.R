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

##plot without outliers

##Percent Female
plot(BBNO$Year,
     BBNO$Percent_Female,
     type = "b",
     pch=16,
     xlab = "Year",
     ylab = "Percent Female Take",
     main = "Percent Female Take 1957-2016",
     sub = "Excluding years: 1975, and 1989",
     lines(BBNO$Year, PerMax1, lty=1, col="red"))

##Male Take
plot(BBNO$Year,
     BBNO$Male,
     type = "b",
     pch=16,
     xlab = "Year",
     ylab = "Male Take",
     main = "Male Take 1957-2016",
     sub = "Excluding years: 1975, and 1989")

##Female Take
plot(BBNO$Year,
     BBNO$Female,
     type = "b",
     pch=16,
     xlab = "Year",
     ylab = "Female Take",
     main = "Female Take 1957-2016",
     sub = "Excluding years: 1975, and 1989")

##age break down for hunt of bears in 2016
##ages were taken by sectioning premolar tooth
AgeData<-read.csv("~/Documents/Black Bear Project/Age_Data_16.csv")
attach(AgeData)

## Data set[call data set(with)Header == this value, this column]
AgeData[AgeData$Gender=="Female",1] #373
AgeData[AgeData$Gender=="Male",1] #528
AgeData[AgeData$Gender=="Unknown",1] #11

Female_Age<-AgeData[AgeData$Gender=="Female",2]
Female_Age
Male_Age<-AgeData[AgeData$Gender=="Male",2]
Male_Age
Unknown_Age<-AgeData[AgeData$Gender=="Unknown",2]
Unknown_Age

Female_Count<-c(1:373)
Male_Count<-c(1:539)
Unknown_Count<-c(1:11)

# average age for the Genders
mean(Female_Age)
mean(Male_Age)
mean(Unknown_Age)

sd(Female_Age)
sd(Male_Age)
sd(Unknown_Age)

##descriptive Stats

describe(Female_Age)
describe(Male_Age)
describe(Unknown_Age)

##running Means
rFM<-rep(6.43, 373)
rMM<-rep(5.04, 539)
rUM<-rep(4.82, 11)

##Plots for gender 

##female
plot(Female_Count,
     Female_Age,
     xlab = "Caught",
     pch=16,
     ylab = "Age",
     main = "Female bear take",
     lines(Female_Count, rFM, lty=1, col="red"))


Female_Age_Quantities<-read.csv("~/Documents/Black Bear Project/Female Age values.csv")


barplot(Female_Age_Quantities$Total,
        col = "light blue",
        space = 0,
        xlab = "Age",
        ylim = c(0,50),
        xlim = c(0,25),
        ylab = "Total Take in 2016",
        main = "Female Bear Counts 2016",
        sub = "0 values represent unknown age",
        names.arg = Female_Age_Quantities$Age)

##male
plot(Male_Count,
     Male_Age,
     type = ,
     pch=16,
     xlab = "Caught",
     ylab = "Age",
     main = "Male Bear Take",
     lines(Male_Count, rMM, lty=1, col="red"))

Male_Age_Quantities<-read.csv("~/Documents/Black Bear Project/Male Age Values.csv")

barplot(Male_Age_Quantities$Total,
        col = "light blue",
        space = 0,
        xlab = "Age",
        ylim = c(0,100),
        xlim = c(0,19),
        ylab = "Total Take in 2016",
        main = "Male Bear Counts 2016",
        sub = "0 values represent unknown age",
        names.arg = Male_Age_Quantities$Age)

##unknown
plot(Unknown_Count,
     Unknown_Age,
     pch=16,
     type = "b",
     xlab = "Caught",
     ylab = "Age",
     main = "Unknown Gender Take",
     lines(Unknown_Count, rUM, lty=1, col="red"))

Unknown_Age_Values<-read.csv("~/Documents/Black Bear Project/Unknown Age Values.csv")

barplot(Unknown_Age_Values$Total,
        col = "light blue",
        space = 0,
        xlab = "Age",
        ylim = c(0,4),
        xlim = c(0,8),
        ylab = "Total Take in 2016",
        main = "Unknown Gendered Bear Counts 2016",
        sub = "These were accurately aged, but not gendered",
        names.arg = Unknown_Age_Values$Age)

