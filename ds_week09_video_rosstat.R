# digital skills, week 9, additional video

# загружаем пакеты
library(tidyverse)
library(readxl)

# устанавливаем рабочую директория
setwd("~/Документы/teaching/2020-21 (HSE)/digital skills/classes/week09")

# загружаем данные В формате Excel
health <- read_excel("Раздел 5- Здравоохранение.xlsx", 
                     sheet = "5.1.1", na = "…", skip = 5)

health <- health %>% rename(region = "...1")

health %>% filter(is.na(`2018`))

health <- health %>% filter(!is.na(`2018`))

health %>% filter(str_detect(region, "едера"))

health <- health %>% filter(!str_detect(region, "едера"))
health <- health %>% filter(!str_detect(region, "Северо"))
