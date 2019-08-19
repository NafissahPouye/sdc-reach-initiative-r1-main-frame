library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #optional #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/sdc-reach-initiative-r1-main-frame")
data <- read_excel("data.xlsx", sheet = "main_frame")
#Resource1 - Main Frame
#Comments - contain id that should be removed
selectedKeyVars <- c(	'are_you_HoHH',
                     'hohh_marital_status',	'hohh_employment',
                     'area_employment_name','hohh_employment_2013',
                     'area_employment_KOATUU', 'hohh_income',
                     'hohh_displacement_status',	'hohh_vulnerability',
                     'hohh_disability_type', 'hohh_level_education',
                     'current_oblast',	'current_raion',	'current_village',
                     'adm4NameLat',	'adm2NameLat',	'adm1NameLat',
                     'hohh_age_full',	'hohh_sex_full',	'cva_area'
                     )
weightVars <- c('Weight_by_cva_area')
#Convert variables into factors
cols =  c('are_you_HoHH','hohh_marital_status', 'hohh_employment',
          'area_employment_name','hohh_employment_2013',
          'area_employment_KOATUU', 'hohh_displacement_status',	
          'hohh_vulnerability', 'hohh_disability_type', 
          'hohh_level_education',  'current_oblast',
          'current_raion',	'current_village',
          'adm4NameLat',	'adm2NameLat',	'adm1NameLat',
          'hohh_age_full',	'hohh_sex_full',	'cva_area')
data[,cols] <- lapply(data[,cols], factor)

#Convert the sub file into dataframe
subVars <- c(selectedKeyVars, weightVars)
fileRes<-data[,subVars]
fileRes <- as.data.frame(fileRes)
objSDC <- createSdcObj(dat = fileRes, 
                       keyVars = selectedKeyVars, weightVar = weightVars
                       )

print(objSDC, "risk")
