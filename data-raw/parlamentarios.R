

library(tabulizer)
library(tidyverse)
file <- "C:\\Users\\usuario\\Desktop\\R_packages\\speech\\ParlamentariosUruguayos.pdf"

# tabla de periodos de legislaturas
tabla_legis <- extract_tables(file, pages = 96)
tabla_legis



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

    m <- lista_legis[[j]]
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
    vector_fechas <- m[(ubic_chamb[length(ubic_chamb)]+1):ifelse(length(ubic_obs) == 0, (ubic_chamb[length(ubic_chamb)]+1), (ubic_obs[1]-1))]
    vector_fechas <- ifelse(length(ubic_chamb) == length(vector_fechas), vector_fechas, paste(vector_fechas, collapse = " ____ "))

    # armo data
    m2 <- data.frame(
        legislador   = m[1],
        partido      = ifelse(length(ubic_party) == 1, substring(partido, regexpr(pattern = "P", partido), nchar(partido)), partido),
        legislatura  = substring(m[ubic_chamb], 1, 2),
        proto_camara = m[ubic_chamb],
        fechas       = vector_fechas#,
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
unique(l$partido)[1:10]


l[l$partido == "RepresentÃ³ al Partido Frente Amplio (43 y 44) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio(45)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "Partido por la TradiciÃ³n Colorada", "partido"] <- "Partido por la Tradicion Colorada"
l[l$partido == "RepresentÃ³ al Partido Colorado ____ RepresentÃ³ al Partido Colorado", ] <- "Partido Colorado"
l[l$partido == "Partido DemÃ³crata Cristiano", "partido"] <- "Partido Democrata Cristiano"
l[l$partido == "Partido Nacional (***)", "partido"] <- "Partido Nacional"
#
l[l$partido == "RepresentÃ³  al Partido Colorado (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 40, "partido"] <- "Partido Colorado"
l[l$partido == "RepresentÃ³  al Partido Colorado (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³  al Partido Colorado (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 43, "partido"] <- "Partido por el Gobierno del Pueblo"
#
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Frente Amplio (43 y 44) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Socialista (38) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura == 38, "partido"] <- "Partido Socialista"
l[l$partido == "RepresentÃ³ al Partido Socialista (38) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "Partido DemÃ³crata Cristiano (Frente Amplio) (42)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido Frente Amplio (43)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (34,35,36,37 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura %in% c(34, 35, 36, 37, 38), "partido"] <- "Partido Comunista del Uruguay"
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (34,35,36,37 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura %in% c(39, 40), "partido"] <- "Frente Izquierda de Liberacion"
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (34,35,36,37 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura == 41, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (30 y 31) ____ RepresentÃ³ al Partido Nacional Independiente (34)" & l$legislatura %in% c(30, 31), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (30 y 31) ____ RepresentÃ³ al Partido Nacional Independiente (34)" & l$legislatura == 34, "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "RepresentÃ³ al Partido Por el Gobierno del Pueblo (43) ____ RepresentÃ³ al Partido Nuevo Espacio (44)" & l$legislatura == 43, "partido"] <- "Partido Por el Gobierno del Pueblo"
l[l$partido == "RepresentÃ³ al Partido Por el Gobierno del Pueblo (43) ____ RepresentÃ³ al Partido Nuevo Espacio (44)" & l$legislatura == 44, "partido"] <- "Partido Nuevo Espacio"
#
l[l$partido == "RepresentÃ³ al Partido Frente Amplio (44) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional  (29,30 y 34) ____ RepresentÃ³ al Partido Nacional Independiente (35,36 y 37)"  & l$legislatura %in% c(29, 30, 34), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional  (29,30 y 34) ____ RepresentÃ³ al Partido Nacional Independiente (35,36 y 37)"  & l$legislatura %in% c(35, 36, 37), "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (31 y 38) ____ RepresentÃ³ al Partido Nacional Independiente (34,35 y 36)" & l$legislatura %in% c(31, 38), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (31 y 38) ____ RepresentÃ³ al Partido Nacional Independiente (34,35 y 36)" & l$legislatura %in% c(34, 35, 36), "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "Partido DemÃ³crata Cristiano (Frente Amplio)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "Progresista/Frente Amplio", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Colorado (38,39,40 y 44) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41 y 42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura %in% c(38, 39, 40, 44), "partido"] <- "Partido Colorado"
l[l$partido == "RepresentÃ³ al Partido Colorado (38,39,40 y 44) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41 y 42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura %in% c(41, 42), "partido"] <- "Partido Democrata Cristiano"
l[l$partido == "RepresentÃ³ al Partido Colorado (38,39,40 y 44) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41 y 42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura  == 43, "partido"] <- "Partido Por el Gobierno del Pueblo"
#
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente ( 35 y 36) ____ RepresentÃ³ al Partido Nacional (37,38,39,40 y 41)" & l$legislatura %in% c(35, 36), "partido"] <- "Partido Nacional Independiente"
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente ( 35 y 36) ____ RepresentÃ³ al Partido Nacional (37,38,39,40 y 41)" & l$legislatura %in% c(37, 38, 39, 40, 41), "partido"] <- "Partido Nacional"
#
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (36) ____ RepresentÃ³ al Partido Nacional (39.40 y 41)" & l$legislatura == 36, "partido"] <- "Partido Nacional Independiente"
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (36) ____ RepresentÃ³ al Partido Nacional (39.40 y 41)" & l$legislatura %in% c(39, 40, 41), "partido"] <- "Partido Nacional"
#
l[l$partido == "Partido Colorado ", "partido"] <- "Partido Colorado"
l[l$partido == "Partido Encuentro Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 43, "partido"] <- "Partido Por el Gobierno del Pueblo"
#
l[l$partido == "Partido Colorado                                                                                                 ", "partido"] <- "Partido Colorado"


unique(l$partido)[1:50]
