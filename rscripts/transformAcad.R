# use this file to generate references

library(here)
library(tidyverse)
wd <- here()
setwd(here::here("rscripts"))
source("bib2acad.R")

bibfile <- "google.bib"


#test <- RefManageR::ReadGS("K6EVDoYAAAAJ", limit = 85, check.entries = F)
#RefManageR::WriteBib(test, "export.bib", verbose = T)

bib2acad(bibfile, copybib = T, abstract = T, overwrite = T)

#file.copy(from=paste0(tempdir(), "/my-md-folder"), to=".", recursive = T)
#file.copy(from=paste0(tempdir(), "/my-bib-folder"), to=".", recursive = T)



### FIX errorneous \\a'e
files <- dir(here::here("rscripts/my-bib-folder"))
for (file in files){
  tx  <- readLines(paste0(here::here("rscripts/my-bib-folder/"),file))
  #file
  tx2  <- str_replace_all(string = tx, pattern = "\\{\\\\a'e\\}", replacement = "\\{\\\\'e\\}") 
  #%>%  str_replace("\\{Calero Valdez\\}", "Calero Valdez")
  
  newfile <- paste0(here::here("rscripts/my-bib-folder/"), file)
  writeLines(tx2, con=newfile)
  print(file)
}

### FIX errorneous {Calero Valdez}
files <- dir(here::here("rscripts/my-md-folder"))
for (file in files){
  tx  <- readLines(paste0(here::here("rscripts/my-md-folder/"),file))
  #file
 
  tx2  <- tx %>%  str_replace("\\{Calero Valdez\\}", "Calero Valdez") %>% 
    str_replace("Andre ", "André ")
  
  newfile <- paste0(here::here("rscripts/my-md-folder/"), file)
  writeLines(tx2, con=newfile)
  print(file)
}




setwd(wd)
