# Plot for time series analysis 
# Published bioinformatics tools in last Five years for COVID-19

library(readxl)
tools <- read_excel("tools.xlsx")
View(tools)
# install reshape2 package
install.packages("reshape2")
# Load library
library("reshape2")
tools <- melt(tools, id.vars = "Year")
head(tools)
# Install ggplot2 package
install.packages("ggplot2") 
# Load ggplot2 package
library("ggplot2") 

# Plot time series 
ggplot(tools,                           
       aes(x = Year,
           y = Value,
           col = variable)) +
  geom_line()
