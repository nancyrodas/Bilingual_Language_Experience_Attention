
##Modulations of the P3b: Exploratory Multiple Linear Regressions Script##

#-----------------------------------------------------------------------

#Author: Rodas De León, N. E.
#Date: January 2026

#Description:
#Exploratory regression models predicting ΔP3b amplitude (Cluster 6)
#from individual language use factor scores (Social Use, Home Use/
#Proficiency, English Proficiency) rather than the composite score,
#to verify the same pattern holds. Results reported in Table S4.

library(tidyverse)
library(lm.beta)

finaldataset <- "Modulations_of_the_P3b_Dataset.csv" #load the dataset
df <- read.csv(finaldataset)

df <- subset(df, Visual_Inspection == 0 & DemoExclude == 0 & Behavior_exclude == 0) #apply exclusion criteria

#center and scale the predictors
social_z <- scale(df$NonEnglish_Social_Use, scale = TRUE, center = TRUE)
home_z <- scale(df$NonEnglish_Home_Use_And_Proficiency, scale = TRUE, center = TRUE)
engpro_z <- scale(df$English_Proficiency, scale = TRUE, center = TRUE)
ses_z <- scale(df$HighestParentEduYears, scale = TRUE, center = TRUE)

#Model 1: Social Use factor score (Cluster 6) --------------------------------------------------------------
cluster6_quadradic_social <- lm(P3b_Amp_Cluster_6 ~ social_z + I(social_z^2) + ses_z, data = df)
summary(cluster6_quadradic_social)
lm.beta(cluster6_quadradic_social)
confint(cluster6_quadradic_social)

#Model 2: Home Use/Proficiency factor score (Cluster 6)  --------------------------------------------------------------
cluster6_quadradic_home <- lm(P3b_Amp_Cluster_6 ~ home_z + I(home_z^2) + ses_z, data = df)
summary(cluster6_quadradic_home)
lm.beta(cluster6_quadradic_home)
confint(cluster6_quadradic_home)

# Model 3: English Proficiency factor score (Cluster 6) -----------------------
cluster6_quadradic_eng <- lm(P3b_Amp_Cluster_6 ~ engpro_z + I(engpro_z^2) + ses_z, data = df)
summary(cluster6_quadradic_eng)
lm.beta(cluster6_quadradic_eng)
confint(cluster6_quadradic_eng)



