# compile csvs from .zip downloaded here, create a single df for all
# Source: http://www1.nyc.gov/site/planning/data-maps/open-data/dwn-pluto-mappluto.page
# unzip file, run in directory one level up 

setwd("../BORO_zip_files_csv")
if (!require('plyr')) install.packages('plyr')

all <- ldply(.data = list.files(pattern="*.csv"),
             .fun = read.csv,
             header = T)

saveRDS(all, '../all_PLUTO_data.rds')