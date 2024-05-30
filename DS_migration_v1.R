################################################################################
#                    DATASCIENCE PROJECT : MIGRATION                           #
################################################################################
rm(list=ls())

# Install packages
install.packages("readxl")
library(readxl)

#--------------------------- Countries of interest  ----------------------------

# List of countries
countries <- c('Morocco', 'Turkey','Syria', 'Algeria', 'Nigeria', 'Iraq', 'Tunisia',
               'Senegal', 'South Africa','Egypt','Iran', 'Ghana', 'Cameroon','Mali',"Côte d'Ivoire",'Lebanon', 
               'Eritrea', 'Guinea','Gambia','Comoros','Israel','Kenya', 'Madagascar',
               'Democratic Republic of the Congo', 'Somalia', 'Congo', 'Saudi Arabia', 'Libya', 'Ethiopia')

# Sub-regions
north_africa <- c('Morocco', 'Algeria', 'Tunisia', 'Libya')
middle_east <- c('Turkey', 'Pakistan', 'Iraq', 'Afghanistan', 'Iran', 'Lebanon', 'Saudi Arabia')
subsa_afria <- c('Nigeria','Senega','Ghana','Cameroon','Mali',"Côte d'Ivoire", 'Guinea', 
                 'Democratic Republic of the Congo','Congo')
east_africa <- c('Somalia', 'Eritrea', 'Ethiopia')


#------------------------------- Load OCDE data  ------------------------------

# Load OCDE data per country and 
germany <- read_xlsx('ocde_germany.xlsx')
germany <- as.data.frame(t(germany))
colnames(germany) <- germany[1,]
germany <- germany[-1,]
germany[,1:ncol(germany)] <- sapply(germany[, 1:ncol(germany)], as.numeric)
GER <- germany[,countries]

france <- read_xlsx('ocde_france.xlsx')
france<- as.data.frame(t(france))
colnames(france) <- france[1,]
france <- france[-1,]
france[,1:ncol(france)] <- sapply(france[, 1:ncol(france)], as.numeric)
FRA <- france[, countries]
  
italy <- read_xlsx('ocde_italy.xlsx')
italy<- as.data.frame(t(italy))
colnames(italy) <- italy[1,]
italy <- italy[-1,]
italy[,1:ncol(italy)] <- sapply(italy[, 1:ncol(italy)], as.numeric)
ITA <- italy[, countries]

uk <- read_xlsx('ocde_UK.xlsx')
uk <- as.data.frame(t(uk))
colnames(uk) <- uk[1,]
uk <- uk[-1,]
uk[,1:ncol(uk)] <- sapply(uk[, 1:ncol(uk)], as.numeric)
UK <- uk[,countries]

spain <- read_xlsx('ocde_spain.xlsx')
spain <- as.data.frame(t(spain))
colnames(spain) <- spain[1,]
spain <- spain[-1,]
spain[,1:ncol(spain)] <- sapply(spain[, 1:ncol(spain)], as.numeric)
SPA <- spain[, countries]

# Put 0 in NA values for addition
germany[is.na(germany)] <- 0
france[is.na(france)] <- 0
italy[is.na(italy)] <- 0
uk[is.na(uk)] <- 0
spain[is.na(spain)] <- 0

# Merge the data in for countries of interest
total_migrants <- as.data.frame(germany[,countries] + france[,countries] + italy[, countries] +
                                  spain[, countries] + uk[,countries])
test <- as.data.frame(t(total_migrants))
write.csv(total_migrants, file = 'total_migrants.csv')

# Write CSV
write.csv(GER, file = 'GER.csv')
write.csv(FRA, file = 'FRA.csv')
write.csv(ITA, file = 'ITA.csv')
write.csv(UK, file = 'UK.csv')
write.csv(SPA, file = 'SPA.csv')

# Show the top 5 immigrants' origin per country
tail(sort(colSums(germany, na.rm = T)),10)
tail(sort(colSums(france, na.rm = T)),10)
tail(sort(colSums(italy, na.rm = T)),10)
tail(sort(colSums(uk, na.rm = T)),10)
tail(sort(colSums(spain, na.rm = T)),10)


#------------------------ Load Independent variables data  ---------------------

#### Access to water and death rate due to unsafe water #### 
water <- read_xlsx('unsafe_water_deaths_no_access_improved_water.xlsx')

#### Global Hunger Index ####
GHI <- read_xlsx('global_hunger_index.xlsx')
str(GHI)

#### Crop Production Index ####
CPI <- read_xlsx('crop_production_index.xlsx')
CPI <- as.data.frame(t(CPI))
CPI <- CPI[-3:-4,]
colnames(CPI) <- CPI[1,]
CPI <- CPI[-1,]

CPI[1,]

TUR <- water[water$Code =='TUR',]
TUR <- as.data.frame(water[water$Code =='TUR',])
rownames(TUR) <- TUR$Year



#------------------------ Loads all data  ---------------------

Total_Migrants_Cleaned_v1 <- read_xlsx('Total Migrants - Cleaned - TO_MERGE.xlsx')
colnames(Total_Migrants_Cleaned_v1)[3] = "Year"

consdata <- read_xlsx('Consolidation of data - v2.xlsx')
consdata <- consdata[-c(1)]

owiddata <- read.csv('OWID/OWID_merged_final.csv', sep = ";", header = TRUE)
undata <- read_xlsx('unempl_total.xlsx')



alldata <- merge(Total_Migrants_Cleaned_v1,consdata,by=c("Code","Year"), all = TRUE)
alldata <- merge(alldata,owiddata,by=c("Code","Year"), all = TRUE)
alldata <- merge(alldata,undata,by=c("Code","Year"), all = TRUE)


#alldata <- alldata[, !duplicated(colnames(alldata))]
#alldata <- subset(alldata, select = -c(Entity.x, Entity.y))

#alldata <- alldata[!is.na(alldata$Name), ]




#------------------------ Writes the whole dataset  ---------------------

write.csv(alldata, file = 'completed_dataset.csv')
data  = read.csv('completed_dataset.csv', sep = ",", header = TRUE)

#------------------------ Regressions  ---------------------

#extra = select(alldata, 'Code', 'Year', 'Total Migrants', 'Crop Production Index', 'Population growth (%annual)')

#------------------------ R dislikes NAs  ---------------------

#extra2<-extra[complete.cases(extra),]


#extra2$logmig = log(extra2$`Total Migrants`)
#extra2$logacc = log(extra2$`Number without access to improved water sources`)
#extra2 <- extra2[!is.infinite(extra2$logacc),]
#fixed.dum = lm(extra2$logmig ~ extra2$logacc+ extra2$`Crop Production Index` + extra2$`Population growth (%annual)` + factor(extra2$Code) - 1)

#summary(fixed.dum)

#yhat = fixed.dum$fitted
#------------------------ Still testing out  ---------------------
#scatterplot(yhat~extra2$`Population growth (%annual)`|extra2$Code, boxplots=FALSE, xlab="Pop growth", ylab="yhat",smooth=FALSE)