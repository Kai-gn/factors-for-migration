# Oneway (individual) effect First-Difference FGLS model
library(plm)

fd_model <- pggls(
  formula = lmigrtotpop ~ crop_index + conflict_deaths + gdp_pcg + inflation +
            unempl_total + pubhealthexp_gdp + political_regime + 
            electricity_access + educ_spending,
  data = datalog,
  effect = "individual",
  model = "fd",
  index = c("Code", "Year")
)

summary(fd_model)

print(coef(summary(fd_model)))

