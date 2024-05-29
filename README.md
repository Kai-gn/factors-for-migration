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

---

## Model

### Approach
- **Regression Model**: Feasible Generalized Least Squares (FGLS) to address heteroskedasticity, serial correlation, and measurement errors.
- **Transformations**: Dependent variable transformed to logarithm of migration rate for normality.

### Final Model

$$\Delta \ln\left(\frac{\text{Migrants}}{\text{Population}}\right) = \gamma + \beta_1 \Delta \text{Crop Index} + \beta_2 \Delta \text{Conflict Deaths} + \beta_3 \Delta \text{GDP per capita growth} + \beta_4 \Delta \text{Inflation} + \beta_5 \Delta \text{Unemployment} + \beta_6 \Delta \text{Public Health Expenditure} + \beta_7 \Delta \text{Political Regime} + \beta_8 \Delta \text{Electricity Access} + \beta_9 \Delta \text{Education Expenditure} + \Delta \epsilon$$


### Hypothesis Testing
- **ADF Tests**: To ensure stationarity.
- **VIF Tests**: To check for multicollinearity.

---

## Analysis

### Results
- **R-Squared**: 0.96, indicating high model fit, possibly inflated.
- **Significant Variables**: Conflict deaths, GDP per capita growth, inflation, unemployment, public health expenditure, political regime, education expenditure.
- **Insignificant Variables**: Crop index, electricity access.

### Discussion

#### Conflicts and Political Instability
- **Findings**: Authoritarian regimes and conflicts increase migration. Democratic transitions can also elevate migration if accompanied by violence.

#### Access to Basic Needs and Agriculture
- **Crop Index**: Not significant. Suggests socio-economic and political factors might outweigh agricultural impacts.

#### Economic Variables
- **Unemployment**: Positive correlation with migration.
- **GDP per Capita Growth**: Negative correlation, complex relationship due to varying GDP levels across countries.
- **Inflation**: Negative correlation with migration, potentially reflecting sector-specific impacts.

#### Socio-Economic Factors
- **Public Education Expenditure**: Positive correlation, indicating a possible "brain drain".
- **Public Health Expenditure**: Negative correlation, suggesting better healthcare retains population.

---

## Conclusion

The study identifies political instability, unemployment, and public service deficiencies as significant push factors for migration. The complex interplay of these factors highlights the need for comprehensive and multi-faceted approaches to migration analysis.

---

## References

A comprehensive list of academic references supporting the study's findings and methodology.

---

## Appendix

Detailed statistical data, tables, and visualizations supporting the analysis.

- **Figures**
  - Figure 1: Pull and Push factors for migration - Lee (1966)
  - Figure 2: Number of migrants per country sorted by region
  - Figure 3: Cumulative migrants per country 1995 - 2018
  - Figure 4: Diagnostic plot of fitted VS actual values for Migrants/TotalPopulation
  - Figure 5: Diagnostic plot of fitted VS actual values for log(Migrants/TotalPopulation)
  - Figure 6: Diagnostic plot of residuals VS fitted values
  - Figure 7: Dispersion of Log(Migrants/Population) across countries
  - Figure 8: Boxplot of Migrants by country
  - Figure 9: Correlation matrix of Migrants (all countries considered)
  - Figure 10: Correlation matrix of Migrants (sorted by region)
  - Figure 11: Cumulated YoY change in migration (sorted by region)
  - Figure 12: Table of Variables
  - Figure 13: Table of Variables

- **Tables**
  - Table 1: First-Difference FGLS Model
  - Table 2: Migrants by country (absolute values)
  - Table 3: Variable - Crop Index Modified (ratio)
  - Table 4: Variable - Conflict Deaths (absolute values)
  - Table 5: Variable - GDP per capita growth (%)
  - Table 6: Variable - Inflation (%)
  - Table 7: Variable - Electricity Access (% of TotalPopulation)
  - Table 8: Variable: Education Expense (% of GDP)
  - Table 9: Variable - Unemployment (%)
  - Table 10: Variable - Public Health Expenditure (% of GDP)
  - Table 11: Variable - Political Regime (discrete values 0 to 3)
