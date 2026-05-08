# Bilingual_Language_Experience_Attention

This repository contains the data processing and analysis scripts for a study examining how bilingual language experience shapes the P3b event-related potential (ERP) component — a neural marker of attention and cognitive resource allocation.

## Project Overview

This project investigates whether individual differences in bilingual language experience predict P3b amplitude during a visual oddball paradigm. Analyses include multiple linear regression models predicting P3b amplitude from language experience factor scores, behavioral outcomes, and exploratory factor variables.

This work is associated with the following manuscript:

> Rodas De León, N. E., Bortfeld, H., & Backer, K. C. (in press). Modulations of the P3b effect as a function of bilingual language experience. *Scientific Reports.*

## Workflow

Scripts should be run in the following order:

| Step | File | Language | Description |
|------|------|----------|-------------|
| 1 | `DescriptivesPercentageEducation.ipynb` | Python | Converts parent education labels to numeric categories and computes percentages for SES descriptive statistics |
| 2 | `BilingualismP3b_11_DecidingonRainbowLangCutOffs.ipynb` | Python | Determines bilingual language experience cutoffs using the Rainbow measure |
| 3 | `Modulation_of_the_P3b_MLR_Analysis.R` | R | Primary multiple linear regression analysis predicting P3b amplitude from language experience factor scores |
| 4 | `Modulations_of_the_P3b_Behavioral_MLR.R` | R | MLR analysis of behavioral outcomes |
| 5 | `Modulations_of_the_P3b_Cluster_Comparisons.R` | R | Cluster-based group comparisons |
| 6 | `Modulations_of_the_P3b_Exploratory_MLR_with_Other_Factor_Scores.R` | R | Exploratory MLR models with additional language experience factor scores |

> **Note:** File paths in the Python notebooks are set to a local directory. Update the `path` variable at the top of each notebook to point to your local data directory before running.

## Requirements

**Python:** pandas, numpy

**R:** tidyverse, ggplot2, lme4, lmerTest, emmeans

## Data Availability

Raw participant data are not included in this repository. Scripts are provided for transparency and reproducibility of the analytical workflow.

## Author

Nancy Rodas De León — [nancye.rodas@gmail.com](mailto:nancye.rodas@gmail.com)
