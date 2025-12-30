library(readr)
laryngectomy <- read_csv("./inst/lary.csv")
usethis::use_data(laryngectomy, overwrite = TRUE)
