setwd("DATA")
if (!require('plyr')) install.packages('plyr')
if (!require('dplyr')) install.packages('dplyr')
if (!require('ggmap')) install.packages('ggmap')

## Compile all data into single df
all <- ldply(.data = list.files(pattern="*.csv"),
             .fun = read.csv,
             header = T)

all$FullAddress <- paste0(all$Address, ", ", all$City.Or.County, ", ", all$State)
geo_reply <- geocode(all$FullAddress, override_limit=TRUE)
all <- cbind(all, geo_reply)

all <- select(all, Incident.Date, FullAddress, lat, lon, X..Killed, X..Injured)
names(all) <- c("Date", "Address", "lat", "lon", "Killed", "Injured")

all$Date <- as.Date(all$Date, format="%B %d, %Y")
all <- all[order(all$Date), ]

all$Content <- paste0("<b>Date: </b>", all$Date, "<br/>",
                      "<b>Killed: </b>", all$Killed, "<br/>",
                      "<b>Injured: </b>", all$Injured, "<br/>",
                      "<b>Location: </b>", all$Address)


# return only those finished (remove once api limit reset)
complete <- complete.cases(all)
completedf <- all[complete,]

#write.csv(all, "GunsGeo.csv", row.names = F)
saveRDS(all, "GunsGeo.rds")