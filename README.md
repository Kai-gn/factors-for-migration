## Title
**Which Factors Best Explain International Migration from Africa and the Middle East?**

---

## Table of Contents
1. [Introduction](#introduction)
2. [Methodology](#methodology)
3. [Model](#model)
4. [Analysis](#analysis)
    - [Results](#results)
    - [Discussion](#discussion)
5. [Conclusion](#conclusion)
6. [References](#references)
7. [Appendix](#appendix)

---

## Introduction

Migration is a significant aspect of human history, influenced by various factors. This study aims to identify the key "push" factors driving international migration from Africa and the Middle East to Europe, focusing on economic, political, and socio-economic determinants. The scope excludes "pull" factors and intra-EU mobility, concentrating on migration to Germany, France, Italy, and Spain from 1995 to 2018.

---
## Institution
This project was part of a Data Science course at the University of Lausanne (UNIL), Master of Science in Finance program.

## Methodology

### Data Collection
- **Source**: OECD database for asylum, residence, and work permit applications.
- **Focus**: Germany, France, Italy, and Spain (excluding the UK due to data issues).
- **Time Period**: 1995 to 2018.
- **Regions**: Sub-Saharan Africa, Horn of Africa, and Middle East.
- **Threshold**: Countries with over 50,000 migrants during the study period.

### Variables
- **Categories**: Economic, agriculture, healthcare, basic necessity, demographic, politics, and conflicts.
- **Sources**: World Bank, Our World in Data.
- **Selection**: Based on relevance and completeness from literature review.

[<img src="/path/to/figure3.png" width="400"/>](path/to/figure3.png)

*Figure 3: Cumulative migrants per country 1995 - 2018*

---

## Model

### Overview
This section outlines the construction of our model and the hypotheses necessary for our analysis. The process involved an in-depth examination of our variables, necessary transformations for regression requirements, and efficiency enhancements through better parametrization.

### Steps and Methodology
1. **Stationarity Testing**:
   - Conducted Augmented Dickey-Fuller (ADF) tests on all variables to ensure stationarity, a prerequisite for our analysis.
   - Identified non-stationarity in the dependent variable (migrant) and two independent variables (child mortality and water access). To address this, we excluded the latter two from our analysis and transformed the migrant variable into a stationary process by normalizing it with the total population.

2. **Normalization and Transformation**:
   - The normalized migrant ratio did not initially meet the normality criteria. We applied successive Boxcox transformations to achieve normal distribution, but ultimately used the natural logarithm of the ratio to resolve the issue while maintaining interpretability.

3. **Addressing Model Inefficiencies**:
   - Initial regressions indicated the presence of heteroskedasticity, serial correlation intra-countries, and measurement errors.
   - Adopted the Feasible Generalized Least Squares (FGLS) model using the R function `pggls` to address these issues, offering a better fit over the standard OLS due to less restrictive assumptions.

4. **First Difference Regression**:
   - Implemented a First Difference FGLS regression, focusing on changes in the dependent and independent variables over time (∆(y) on ∆(x)).
   - This approach required the assumption that the error term differences are uncorrelated with the independent variable differences, allowing the model to remain unbiased and consistent.
   - Chose this model over a Fixed Effects model to avoid the strict exogeneity requirement and potential omitted variable bias (OVB) from time-invariant factors.

### Benefits
- The First Difference method isolates the effects of time, allowing us to measure the impact of variables independently of time-related factors.
- Provides a robust framework for analyzing the dynamics of migration while accounting for country-specific variations and temporal dynamics.

### Final Model

$$\Delta \ln\left(\frac{\text{Migrants}}{\text{Population}}\right) = \gamma + \beta_1 \Delta \text{Crop Index} + \beta_2 \Delta \text{Conflict Deaths} + \beta_3 \Delta \text{GDP per capita growth}$$

$$ +\ \beta_4 \Delta \text{Inflation} + \beta_5 \Delta \text{Unemployment} + \beta_6 \Delta \text{Public Health Expenditure}$$

$$ +\ \beta_7 \Delta \text{Political Regime} + \beta_8 \Delta \text{Electricity Access} + \beta_9 \Delta \text{Education Expenditure} + \Delta \epsilon$$

---

## Analysis

### Results

The FGLS regression model yielded an R-squared value of 0.96, indicating a high level of explanatory power, although this may be partially due to overfitting or other model biases. The results demonstrated significant correlations for several variables at the 99% and 99.9% significance levels, except for the crop index and electricity access, which were not statistically significant.

[<img src="/path/to/figure4.png" width="400"/>](path/to/figure4.png)

*Figure 4: Diagnostic plot of fitted VS actual values for Migrants/TotalPopulation*

[<img src="/path/to/figure5.png" width="400"/>](path/to/figure5.png)

*Figure 5: Diagnostic plot of fitted VS actual values for log(Migrants/TotalPopulation)*

[<img src="/path/to/figure6.png" width="400"/>](path/to/figure6.png)

*Figure 6: Diagnostic plot of residuals VS fitted values*

[<img src="/path/to/figure_regression.png" width="400"/>](path/to/figure_regression.png)

*Figure 7: Regression Results Plot*

- **Conflict Deaths**: Positive and significant correlation with migration. An increase in conflict-related deaths tends to push more individuals to migrate.
- **GDP per Capita Growth**: Negative correlation with migration, suggesting that higher economic growth in origin countries reduces the migration rate.
- **Inflation**: Negative and significant correlation, indicating that higher inflation in origin countries reduces migration rates.
- **Unemployment**: Positive and significant correlation, highlighting that higher unemployment rates in origin countries drive higher migration rates.
- **Public Health Expenditure**: Negative correlation, implying that better healthcare access reduces the propensity to migrate.
- **Political Regime**: Positive correlation with migration. More liberal political regimes are associated with higher migration rates.
- **Education Expenditure**: Positive and significant correlation, suggesting that higher public spending on education correlates with increased migration, possibly due to the "brain drain" effect.

### Discussion

#### Conflicts and Political Instability

The presence of conflicts and political instability in origin countries significantly drives migration. Authoritarian regimes often push individuals to seek better living conditions and opportunities abroad. However, the repression of movement within these regimes can suppress actual migration numbers despite a high desire to leave. Transitional democracies experiencing increased violence and conflicts, such as during the Arab Spring, show higher migration rates as people flee instability.

#### Access to Basic Needs and Agriculture

The expectation that agricultural productivity would be a significant driver of migration was not supported by the model. The modified crop index used as a proxy for agricultural productivity did not show a significant impact. This suggests that socio-economic and political factors may overshadow environmental and agricultural influences. Additionally, measurement errors and regional variability in agricultural data might have affected the results.

[<img src="/path/to/figure7.png" width="400"/>](path/to/figure7.png)

*Figure 8: Dispersion of Log(Migrants/Population) across countries*

#### Economic Variables

Economic conditions play a critical role in migration decisions. Higher unemployment rates in origin countries are strongly associated with increased migration, as individuals seek job opportunities abroad. Conversely, GDP per capita growth showed a negative correlation with migration, reflecting the complexity of the migration-development relationship. While higher income can enable migration, beyond a certain threshold, economic stability tends to retain the population. The negative impact of inflation on migration could indicate that rising costs of living discourage migration by reducing disposable income.

#### Socio-Economic Factors

Investment in public education correlates with higher migration rates, likely due to the migration of educated individuals seeking better opportunities—a phenomenon known as "brain drain." This effect is nuanced, as it can eventually lead to economic benefits for the origin country through remittances and potential return migration. In contrast, better public health expenditure reduces migration by improving living conditions and reducing the need to seek healthcare abroad.

[<img src="/path/to/figure8.png" width="400"/>](path/to/figure8.png)

*Figure 9: Boxplot of Migrants by country*

---

## Conclusion

The study identifies key socio-economic and political drivers of migration from Africa and the Middle East to Europe. Political instability, unemployment, and inadequate public services are major push factors. The findings underscore the importance of considering a multi-faceted approach to understanding migration, as the interplay of various factors is complex and context-specific.

---

## References

A comprehensive list of academic references supporting the study's findings and methodology.
