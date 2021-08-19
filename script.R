# SARS CoV-2 sequence density on word map
library(RColorBrewer)
library(rworldmap)
library(readxl)
library(kableExtra)
library(readxl)
cov_data <- read_excel("cov_data.xlsx")
View(cov_data)
df<-head(cov_data)
kable(df) %>%
  kable_styling(bootstrap_options = "striped", font_size= 10, full_width = F)
#Aggregate cov_data by Country
cov_data<- aggregate(cov_data$strains, by=list(Country=cov_data$Country), FUN=sum)
#Rename aggregated column from x to strains
colnames(cov_data)[colnames(cov_data)=="x"] <- "SARS CoV-2 sequence density on word map"
#join data to a map
WorldMapstrains <- joinCountryData2Map( cov_data,
                                                  nameJoinColumn="Country",
                                   joinCode="NAME",mapResolution = "high" )
#Set the color palette with RColorBrewer:
colourPalette <- RColorBrewer::brewer.pal(10,'Spectral') #'Purples'

#plot the map
mapCountryData(WorldMapstrains, 
              nameColumnToPlot="Country", 
              catMethod='fixedWidth',
              colourPalette=colourPalette, #'diverging', 'heat'
              numCats=5) #10
