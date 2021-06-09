
library(tabulizer)
library(tidyverse)

file <- "C:\\Users\\usuario\\Desktop\\ESCRITORIO HP\\R_packages\\speech\\ParlamentariosUruguayos.pdf"
# tabla de periodos de legislaturas
tabla_legis <- extract_tables(file, pages = 96, encoding = 'UTF-8')
tabla_legis <- tabla_legis[[1]]
tabla_legis <- tabla_legis[-c(1,2,3),]

all <- data.frame(
    legislatura = tabla_legis[,1],
    inicio_old  = tabla_legis[,3],
    fin_old     = tabla_legis[,4]
)

all$inicio <- lubridate::parse_date_time(all$inicio_old, order = "dmy")
all$fin    <- lubridate::parse_date_time(all$fin_old, order = "dmy")
all$dias   <- lubridate::time_length(lubridate::interval(all$inicio, all$fin), "days")

legislaturas <- all[, c(1, 4, 5, 6)]
save(legislaturas, file = "data/legislaturas.rda")


partidos_uy <- Boreluy::partidos_uy
usethis::use_data(partidos_uy, partidos_uy, internal = TRUE)


