rm(list = ls())

library(readxl)
library(data.table)
library(tidyr)
library(dplyr)

# -- setting ------
setwd("~/workspace")

# import data
input  = fread("input.csv", encoding = "UTF-8")
profit = read_excel("이자수익.xlsx")

input = input[, -1]
colnames(input)[1] = colnames(profit)[3]

input$회계년도 = as.character(input$회계년도)

profit$회계년도 = stringr::str_replace(profit$회계년도, "/", "")

data = profit %>% select(-"이자수익(*)(IFRS)(천원)") %>% 
  select("회사명", "회계년도", contains("이자수익")) %>% 
  left_join(input, by = "회계년도") %>% unique()

data$회계년도 %>% unique()
data$회계년도 = substr(data$회계년도, 1, 4)

colnames(data)[3:6] = as.character(1:4)

data = data %>% gather(c("1", "2", "3", "4"),  key = "분기", value = profit) %>% 
  select("회사명", "회계년도", "분기", "profit", "text")

write.csv(data, "processing_R.csv", row.names = F)