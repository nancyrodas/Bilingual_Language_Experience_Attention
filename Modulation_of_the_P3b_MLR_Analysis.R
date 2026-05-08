##Modulations of the P3b: Multiple Linear Regression Script##

#-----------------------------------------------------------------------

#Author: Rodas De León, N. E.
#Date: January 2026

#Description:
# This script processes the Modulations of the P3b dataset by
# applying exclusion criteria (visual inspection, demographic,
# and behavioral), and running multiple linear regression models
#predicting RT Effect (Rare RT - Frequent RT) and P3b amplitude (Cluster 6)
# from composite factor score (linear and
# quadratic terms) and socioeconomic status (parental education).

library(tidyverse)
library(lm.beta)

finaldataset <- "Modulations_of_the_P3b_Dataset.csv" #load the dataset
df <- read.csv(finaldataset)

df <- subset(df, Visual_Inspection == 0 & DemoExclude == 0 & Behavior_exclude == 0) #apply exclusion criteria

#center and scale the predictors
comp_z <- scale(df$Composite_Factor_Score, scale = TRUE, center = TRUE)
ses_z <- scale(df$HighestParentEduYears, scale = TRUE, center = TRUE)

# Running Model 1:RT Effect ~ Deg of Bilingualism + SES -----------------------------------
RT_effect <- lm(RT_Effect ~ comp_z + I(comp_z^2) + ses_z, data = df)
summary(RT_effect)
lm.beta(RT_effect)
confint(RT_effect)

# Running Model 2:P3b Amplitude over Centroparietal Cluster ~ Deg of Bilingualism + SES -----------------------------------
#note Cluster 6 includes Pz, P3, P4, CP1, CP2, CP6
P3b_amp_Cluster6 <- lm(P3b_Amp_Cluster_6 ~ comp_z + I(comp_z^2) + ses_z, data = df)
summary(P3b_amp_Cluster6)
lm.beta(P3b_amp_Cluster6)
confint(P3b_amp_Cluster6)

#Linear models ----------------------------

RT_effect_linear <- lm(RT_Effect ~ comp_z + ses_z, data = df)
summary(RT_effect_linear)
lm.beta(RT_effect_linear)
confint(RT_effect_linear)

P3b_amp_Cluster6_linear <- lm(P3b_Amp_Cluster_6 ~ comp_z + ses_z, data = df)
summary(P3b_amp_Cluster6_linear)
lm.beta(P3b_amp_Cluster6_linear)
confint(P3b_amp_Cluster6_linear)
