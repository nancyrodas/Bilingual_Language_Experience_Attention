##Modulations of the P3b: Behavioral Outcomes MLR Script#

#-----------------------------------------------------------------------

#Author: Rodas De León, N. E.
#Date: January 2026

#Description:
#Multiple regression models predicting behavioral outcomes (d', Rare RT,
#Frequent RT, Rare Accuracy, Frequent Accuracy) from bilingual composite
#score (linear and quadratic) and childhood parental education. Neither
#predictor significantly explained behavioral variance. Results reported
#in Table S2.

library(tidyverse)
library(lm.beta)

finaldataset <- "Modulations_of_the_P3b_Dataset.csv" #load the dataset
df <- read.csv(finaldataset)

df <- subset(df, Visual_Inspection == 0 & DemoExclude == 0 & Behavior_exclude == 0) #apply exclusion criteria

comp_z <- scale(df$Composite_Factor_Score, scale = TRUE, center = TRUE)
ses_z <- scale(df$HighestParentEduYears, scale = TRUE, center = TRUE)

# Model 1: d-prime --------------------------------------------------------
d_prime_quad <- lm(d_prime ~ comp_z + I(comp_z^2) + ses_z, data = df)
summary(d_prime_quad)
lm.beta(d_prime_quad)
confint(d_prime_quad)

# Model 2: Rare RT --------------------------------------------------------
rare_rt_quad <- lm(Rare_RT ~ comp_z + I(comp_z^2) + ses_z, data = df)
summary(rare_rt_quad)
lm.beta(rare_rt_quad)
confint(rare_rt_quad)

# Model 3: Frequent RT ----------------------------------------------------
freq_rt_quad <- lm(Frequent_RT ~ comp_z + I(comp_z^2) + ses_z, data = df)
summary(freq_rt_quad)
lm.beta(freq_rt_quad)
confint(freq_rt_quad)

# Model 4: Rare Accuracy --------------------------------------------------
rare_acc_quad <- lm(Rare_acc_decimal ~ comp_z + I(comp_z^2) + ses_z, data = df)
summary(rare_acc_quad)
lm.beta(rare_acc_quad)
confint(rare_acc_quad)

# Model 5: Frequent Accuracy ----------------------------------------------
freq_acc_quad <- lm(Freq_acc_decimal ~ comp_z + I(comp_z^2) + ses_z, data = df)
summary(freq_acc_quad)
lm.beta(freq_acc_quad)
confint(freq_acc_quad)