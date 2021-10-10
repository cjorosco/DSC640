# DSC640 Week 5 and  6 Orosco
# 1 tree map, 1 area chart and 1 stacked area chart

# Set working directory
setwd("/Users/corosco/DSC640/DSC640-class/week-5-6/data")

# Import Library
install.packages("tidyverse")
library(tidyverse)


# Read in the csv file
df1 <- read.csv("unemployement-rate-1948-2010.csv", header = TRUE)
df1

df_sub <- subset(df1, Year > 1999)
df_sub

# Create tree map
install.packages("treemapify")
library(treemapify)

install.packages("treemap")
library(treemap)

treemap(df_sub,index = c("Year","Period"), vSize ="Value",
        type="index",
        palette="RdYlBu",range=c(-20000,60000),
        mapping=c(-20000,10000,60000),
        fontsize.labels=c(10,8),
        align.labels=list(c("center", "top"),
          c("right", "bottom")),
        overlap.labels=0.6,
        title = "R Treemap: Unemployment Rates per Year 2000 - 2010",
        fontsize.title = 12)
    


# Tried to use treemapify couldn't get it to list a single occurrence 
# of a year.
ggplot(df_sub, aes(area = Year, fill = Value, label = Year)) +
  geom_treemap() +
  geom_treemap_text()




# Create Stacked Area Chart
# Import ggplot2
library(ggplot2)

g <- ggplot(df1, aes(x=Year, y=Value, fill=Period))
g + scale_x_continuous(breaks=seq(1948,2010,10)) +
geom_area() + 
ggtitle("R Stacked Area Chart: Unemployement Rate 1948-2010") +
scale_fill_brewer(palette="Paired")
theme(plot.title = element_text(hjust = 0.5)) +
labs(x="Year", y="Unemployment Rate per million")


# Create Area Chart
# Create Data frame with mean unemployment rate per year

df2 <- df1 %>% 
  group_by(Year) %>%
  summarize(Mean_Val = mean(Value))
head(df2)


# Plot Area Chart

ggplot(df2, aes(x=Year, y=Mean_Val)) +
geom_area(fill=4, alpha = 0.5, color = 6, lwd = 0.5, linetype = 1) +
scale_x_continuous(breaks=seq(1948,2010,10)) +
ggtitle("R Area Chart: Mean Unemployement Rate 1948-2010") +
theme(plot.title = element_text(hjust = 0.8)) +
labs(x="Year", y="Mean Unemployment Rate (million)")

