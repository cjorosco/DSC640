# DSC640 Week 3 and  4 Orosco
# Line and step charts

# Set working directory
setwd("/Users/corosco/DSC640")

# Import Library to read excel files
install.packages("tidyverse")
library(tidyverse)
library(readxl)

# Read in the excel file
df1 <- read_excel("world-population.xlsm")
df1

# Import ggplot2
library(ggplot2)
library(scales)
# Create line chart


g <- ggplot(data=df1, aes(x=Year, y=Population))

  g + geom_line(color="steelblue", size=2, alpha=0.9, linetype=1) +
  scale_y_continuous(labels = comma) +
  ggtitle("Population Growth 1960 - 2010") +
  theme(plot.title = element_text(hjust = 0.5))

g + 
   scale_y_continuous(labels = comma) +
    geom_step(direction="vh") +
    ggtitle("Population Growth 1960 - 2010") +
    theme(plot.title = element_text(hjust = 0.5))