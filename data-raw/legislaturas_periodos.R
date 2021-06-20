
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

add <-
    tibble::tribble(
    ~legislatura, ~inicio_old, ~fin_old,
    47L, "15.02.2010", "14.02.2015",
    48L, "15.02.2015", "14.02.2020",
    49L, "15.02.2020", "14.02.2025"
    )

all <- rbind(all, add)
all$inicio_old[17] <- "08.02.1891"

all$fecha_inicio <- lubridate::parse_date_time(all$inicio_old, order = "dmy")
all$fecha_fin    <- lubridate::parse_date_time(all$fin_old, order = "dmy")
all$dias         <- lubridate::time_length(lubridate::interval(all$fecha_inicio, all$fecha_fin), "days")

legislaturas <- all[, c(1, 4, 5, 6)]
legislaturas$periodo <- paste0(substring(all$fecha_inicio, 1, 4), "-",
                               substring(all$fecha_fin, 1, 4))

save(legislaturas, file = "data/legislaturas.rda")


partidos_uy <- Boreluy::partidos_uy
usethis::use_data(partidos_uy, partidos_uy, internal = TRUE)


