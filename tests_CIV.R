library(plm)
library(CADFtest)
library(dLagM)
library(vars)

fd01_CIV <- plm(migrants ~ crop_index + gdp_pcg + ratedeaths_allagesex + factor(political_regime), 
                data = base01_CIV, index = c("Code", "Year"), model = "fd")

random01_CIV <- plm(migrants ~ crop_index + gdp_pcg + ratedeaths_allagesex + factor(political_regime), 
                    data = base01_CIV, index = c("Code", "Year"), model = "random")
summary(random01_CIV)

fixed01_CIV <- plm(migrants ~ crop_index + gdp_pcg + ratedeaths_allagesex + factor(political_regime), 
                   data = base01_CIV, index = c("Code", "Year"), model = "within")
summary(fixed01_CIV)
fixef(fixed01_CIV)
pFtest(fixed01_CIV, random01_CIV)

#Hausman test
base04_CIV <- subset(base04, Code == "CIV")

phtest(fixed01_CIV, random01_CIV)  # best model ?

base01_CIV <- subset(base01, Code == "CIV")

#Dickey Fuller
summary(CADFtest(migrants ~ crop_index + gdp_pcg + ratedeaths_allagesex + factor(political_regime), 
                 type = "trend", data = base01_CIV, criterion = "AIC"))

#Plotting multivar time series
mvtsplot(base02_CIV, levels = 3, smooth.df = NULL, margin = TRUE, sort = NULL, 
         main = "", palette = "YlGnBu", rowstat = "median")

#ARDL
ardlBound(data = base01_CIV, formula = migrants ~ crop_index + gdp_pcg + ratedeaths_allagesex + 
          factor(political_regime), case = 5, p = NULL, remove = NULL, autoOrder = FALSE, 
          HAC = TRUE, ic = "AIC", max.p = 15, max.q = 15, ECM = TRUE, stability = TRUE)

#Normality tests 
qqnorm(fixed01_CIV$residuals)
shapiro.test(data$migrants)
lambda <- BoxCox.lambda(data$migrants)
data$transmigr <- BoxCox(data$migrants, lambda)
shapiro.test(data$transmigr)
lambda2 <- BoxCox.lambda(data$transmigr)
data$transmigr2 <- BoxCox(data$transmigr, lambda2)
shapiro.test(data$transmigr2)

#CADF
summary(CADFtest(transmigr2 ~ crop_index + conflict_deaths + gdp_pcg + pgrowth + inflation + 
                 child_mort + electricity_access + educ_spending + unempl_total + pubhealthexp_gdp + 
                 political_regime, type = "trend", data = base04_CIV, criterion = "AIC"))
