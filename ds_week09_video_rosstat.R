# digital skills, week 9, additional video

# загружаем пакеты
library(tidyverse)
library(readxl)

# устанавливаем рабочую директорию
setwd("~/Документы/teaching/2020-21 (HSE)/digital skills/classes/week09")

# загружаем данные о здоровье
health <- read_excel("Раздел 5- Здравоохранение.xlsx",
                     sheet = "5.1.1", na = "…", skip = 5)

health <- health %>% rename(region = "...1")

health %>% filter(is.na(`2018`))

health <- health %>% filter(!is.na(`2018`))

health %>% filter(str_detect(region, "едера"))

health <- health %>% filter(!str_detect(region, "едера"))
health <- health %>% filter(!str_detect(region, "Северо"))


# загружаем данные об инфляции
library(readxl)
cpi_regions <- read_excel("Раздел 21- Цены и тарифы.xlsx",
                                      sheet = "21.1.", na = "…", skip = 5)

cpi_regions <- read_excel("Раздел 5- Здравоохранение.xlsx",
                     sheet = "5.1.1", na = "…", skip = 5)

cpi_regions <- cpi_regions %>% rename(region = "...1")

cpi_regions %>% filter(is.na(`2018`))

cpi_regions <- cpi_regions %>% filter(!is.na(`2018`))

cpi_regions %>% filter(str_detect(region, "едера"))

cpi_regions <- cpi_regions %>% filter(!str_detect(region, "едера"))
cpi_regions <- cpi_regions %>% filter(!str_detect(region, "Северо"))

cpi_regions <- cpi_regions %>% mutate(region = replace(region, str_detect(region, "\t"), " "))

cpi_regions_long <- cpi_regions %>% pivot_longer(cols = `2000`:`2018`,
                                            names_to = "year",
                                            values_to = "cpi")

# загружаем данные об инвестициях
grp <- read_excel("Раздел 9- Валовой региональный продукт.xlsx",
                  sheet = "9.3.", na = "…", skip = 4)

grp <- grp %>% rename(region = "...1")

grp <- grp %>% filter(!is.na(`2017`))

grp <- grp %>% filter(!str_detect(region, "едера"))

grp_long <- grp %>% pivot_longer(cols = `2000`:`2017`,
                                names_to = "year",
                                values_to = "grp")
