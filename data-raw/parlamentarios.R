
library(tabulizer)
library(tidyverse)
file <- "C:\\Users\\usuario\\Desktop\\R_packages\\speech\\ParlamentariosUruguayos.pdf"

# tabla de periodos de legislaturas
tabla_legis <- extract_tables(file, pages = 96)

legisladores <-
    extract_text(file, pages = 296:1207) %>%
    unlist() %>%
    paste(collapse = " ") %>%
    strsplit(., split = "\n") %>%
    unlist() %>%
    stringr::str_replace_all(pattern = " \r", replacement = "") %>%
    .[which(nchar(.) > 5L)]


ul <- grep(pattern = "^[A-Z]{3}" , legisladores)
lista_legis <- list()
for(i in 1: (length(ul)-1)){
    lista_legis[[i]] <- legisladores[ul[i]:(ul[i+1]-1)]
}

lista_df_legis <- list()
for(j in 1:length(lista_legis)){

    m <- lista_legis[[j]]#954
    print(j)

    # partido
    ubic_party <- stringr::str_which(m, pattern = "Represen")
    partido    <- paste(m[ubic_party], collapse = " ____ ")

    # camaras
    ubic_chamb <- stringr::str_which(m, pattern = "( Diputados | Senado )")
    if(length(ubic_chamb) == 0)  ubic_chamb <- ubic_party + 2
    chamber    <- paste(m[ubic_chamb], collapse = " ____ ")

    # observaciones
    ubic_obs <- stringr::str_which(m, pattern = "^[\\(*]")
    observa  <- ifelse(length(ubic_obs) == 0, "",  paste(m[ubic_obs[1]:length(m)], collapse = " ____ "))

    # fechas
    vector_fechas <- m[(ubic_chamb[length(ubic_chamb)]+1) : ifelse(length(ubic_obs) == 0, length(m), (ubic_obs[1]-1))]
    if(length(ubic_chamb) == length(vector_fechas)){
        vector_fechas <- vector_fechas
        testigo_fecha <- ifelse(stringr::str_detect(string = vector_fechas, pattern = "Suple"), 1L, 0L)
    } else {
        vector_fechas <- paste(vector_fechas, collapse = " ____ ")
        testigo_fecha <- ifelse(stringr::str_detect(string = vector_fechas, pattern = "___"), 1L, 0L)
    }

    # armo data
    m2 <- data.frame(
        legislador    = m[1],
        partido       = ifelse(length(ubic_party) == 1, substring(partido, regexpr(pattern = "P", partido), nchar(partido)), partido),
        legislatura   = substring(m[ubic_chamb], 1, 2),
        proto_camara  = m[ubic_chamb],
        fechas        = vector_fechas,
        testigo_fecha = testigo_fecha
        #observa      = observa
    )

    # se limpian variables
    m2$camara    <- ifelse(stringr::str_detect(m2$proto_camara, "Senado" ), "Senado" , "Diputados")
    m2$condicion <- ifelse(stringr::str_detect(m2$proto_camara, "Titular"), "Titular", "Suplente")
    rango <- numeric()
    for(i in 1:nrow(m2)){rango[i] <- sum(nchar(m2$legislatura[i]), nchar(m2$camara[i]), nchar(m2$condicion[i]), 4)}
    m2$departamento <- substring(m2$proto_camara, rango, nchar(m2$proto_camara))

    # se guardan
    lista_df_legis[[j]] <- m2
}

l <- do.call(rbind, lista_df_legis)



## periodo en el cargo del legislador

base_testigo_0 <- subset(l, l$testigo_fecha == 0)
base_testigo_1 <- subset(l, l$testigo_fecha == 1) # error

## base 0
base_testigo_0 <- separate(data = base_testigo_0,
                           col = 'fechas',
                           into = c("fecha_inicio", "fecha_fin"),
                           sep = "( a | al )")

base_testigo_0$fecha_inicio <-
    substring(base_testigo_0$fecha_inicio, 7, 50) %>%
    stringr::str_remove_all(pattern = "(al...|\\.\\.\\.)") %>%
    stringr::str_squish()

base_testigo_0$fecha_fin <-
    stringr::str_remove_all(base_testigo_0$fecha_fin, pattern = "[^A-z\\d. ]") %>%
    stringr::str_remove_all(pattern = "(Diputados|Senado)") %>%
    stringr::str_squish()


## base 1

base_testigo_1 <- data.frame(
    legislador      = base_testigo_1$legislador,
    partido         = base_testigo_1$partido,
    legislatura     = base_testigo_1$legislatura,
    proto_camara    = base_testigo_1$proto_camara,
    fecha_inicio    = base_testigo_1$fechas,
    fecha_fin       = NA,
    testigo_fecha   = base_testigo_1$testigo_fecha,
    camara          = base_testigo_1$camara,
    condicion       = base_testigo_1$condicion,
    departamento    = base_testigo_1$departamento
)


l <- rbind(base_testigo_0, base_testigo_1)

#View(l)
# check
#l$fecha_inicio[stringr::str_which(l$fecha_inicio, pattern = '^\\D')]


















