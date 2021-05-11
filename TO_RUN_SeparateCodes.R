rm(list = ls(all=TRUE))


if (!require("rstudioapi")) install.packages("rstudioapi")
if (!require("data.table")) install.packages("data.table")
if (!require("xlsx")) install.packages("xlsx")

thisdir <- setwd(dirname(rstudioapi::getSourceEditorContext()$path))
source(paste0(thisdir,"/SeparateCodes.R"))

input <- read.xlsx2(paste0(thisdir,"/INPUT.xlsx"), sheetIndex = 1)

output <- Separate_codes(
  
  codesheet = input,
  code_col = c("SNOMEDCT_US_c","RCD2_c","ICD9CM_c" ),
  separator = ",",
  vars = c("Concept","Concept.name")
  
  
)

#fwrite(output,paste0(thisdir,"/OUTPUT.csv"))
