#Exercise 9

#Install packages
install.packages("ggplot2")
install.packages("cowplot")

# Load packages 
library(ggplot2)
library(cowplot)

#1: Two variable data loaded into scatter plot with trend line

#Our data was downloaded from Kaggle. It contains information on the height and weight of 99 males
Male_Data <- read.csv("MaleData.csv")

x <- Male_Data$Height
y <- Male_Data$Weight
            
a = ggplot(data = Male_Data, aes(x=x, y=y))
a + geom_point(color = "blue", shape = 4) + theme_bw() + ggtitle("Male Height vs Weight") + xlab("Height (in)") + ylab("Weight (lbs)") + stat_smooth(method = "lm")


#2: Scatterplot and Bargraph by Region

#Read in data
data <- read.table("data.txt", header = TRUE, sep = ",")

a =ggplot(data = data,aes(x = region, y = observations))+ xlab("Region") + ylab("Observations")+
stat_summary(geom = "bar",fun.y = "mean", fill = c("east" = "royal blue", "north" = "chartreuse3", "south" = "cadetblue2", "west" = "darkviolet")) + stat_summary(geom = "errorbar", fun.data = "mean_se", width = 0.3) + theme_bw() + ggtitle("Bargraph: Observations by Region")


b =  ggplot(data = data, aes(x = region, y = observations)) + geom_jitter(aes(color = as.factor(region))) + theme_bw() + xlab("Region") + ylab("Observations") + scale_color_manual(name = "region", values = c("royal blue", "chartreuse3", "cadetblue2", "darkviolet")) + ggtitle("Scatterplot: Observations by Region")

#Plot both side by side
plot_grid(a, b, ncol = 2)

#Answer: Differences between the bargraph and scatterplot:
#While the bargraph is able to clearly show that all four regions have an average of 15 observations, it does not do a good job of portraying the spread of the data. While the larger error bars of the south and west regions do indicate a larger variability in the data, the scatter plot portrays this in a much clearer manner. Through the scatterplot, we are able to observe that the south region observations seem to follow a binomial distribution, and that the west and east observations are widely variable. The observations in the north region have a low variability as they all lie close to the mean of 15. 

