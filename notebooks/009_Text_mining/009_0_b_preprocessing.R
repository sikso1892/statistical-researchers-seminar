library(data.table)
library(dplyr)

# -- 20, 21년도 EDA ------
data = fread("pre_input_1.csv", encoding = "UTF-8")

profit = fread("processing_R.csv")
profit %>% colnames


colnames(data)

data$회계년도 = substr(data$date, 1, 4)
data$month    = substr(data$date, 5, 6)

data$분기 = ifelse(data$month == "03", 1,
                 ifelse(data$month == "06", 2, 
                        ifelse(data$month == "09", 3, 4)))

data$회계년도 = data$회계년도 %>% as.numeric()
data$분기     = data$분기     %>% as.numeric()  

dat…