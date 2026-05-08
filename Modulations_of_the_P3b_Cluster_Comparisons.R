##Modulations of the P3b: Cluster Size Comparisons##

#-----------------------------------------------------------------------

#Author: Rodas De León, N. E.
#Date: January 2026

#Description:
  # This script runs multiple regression models predicting ΔP3b amplitude
  # from bilingual composite score (linear and quadratic) and childhood
  # parental education across four electrode cluster sizes to assess
  # robustness of effects. Results reported in Table S6
#-----------------------------------------------------------------------

library(tidyverse)
library(lm.beta)

finaldataset <- "Modulations_of_the_P3b_Dataset.csv" #load the dataset
df <- read.csv(finaldataset)
df <- subset(df, Visual_Inspection == 0 & DemoExclude == 0
             & Behavior_exclude == 0) #apply exclusion criteria

#center and scale the predictors
comp_z <- scale(df$Composite_Factor_Score, scale = TRUE, center = TRUE)
ses_z <- scale(df$HighestParentEduYears, scale = TRUE, center = TRUE)

# Running MLR Models with different electrode cluster size = 26 -----------------
Cluster_26 <- lm(Amp_Cluster_26 ~ comp_z + I(comp_z^2)
                          + ses_z, data = df)
summary(Cluster_26)
lm.beta(Cluster_26)
confint(Cluster_26)

# Running MLR Models with different electrode cluster size = 10 ----------------
Cluster10 <- lm(P3b_Amp_Cluster_10 ~ comp_z + I(comp_z^2) + ses_z, data = df)
summary(Cluster10)
lm.beta(Cluster10)
confint(Cluster10)

# Running MLR Models with different electrode cluster size = 3 ----------------
Cluster_3 <- lm(P3b_Amp_Cluster_3 ~ comp_z + I(comp_z^2) + ses_z, data = df)
summary(Cluster_3)
lm.beta(Cluster_3)
confint(Cluster_3)