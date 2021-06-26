#' @importFrom magrittr %>%
#' @importFrom tibble as_tibble
#' @importFrom speech speech_word_count
#' @importFrom Rdpack reprompt


vars <- c("politicos", "legislador2","party", "legislator",
          "partido", "legislator_nc", "legislature", "legislatura", "Partido", "Sigla", "partidos_uy")

if(getRversion() >= "2.15.1"){
    utils::globalVariables(c('.', vars))
    utils::suppressForeignCheck(c('.'))
}

step <- function(x, y, step){

    if(step == 1){x$ids <- paste(x$apellido,          x$legislatura,      x$camara, x$sexo)} # match completo
    if(step == 2){x$ids <- paste(surname(x$apellido), x$legislatura,      x$camara, x$sexo)} # un solo apellido
    if(step == 3){x$ids <- paste(x$apellido,          c(x$legislatura-1), x$camara, x$sexo)} # legislatura anterior
    if(step == 4){x$ids <- paste(x$apellido,          c(x$legislatura+1), x$camara, x$sexo)} # legislatura posterior
    if(step == 5){x$ids <- paste(surname(x$apellido), c(x$legislatura-1), x$camara, x$sexo)} # legislatura anterior y un solo apellido
    if(step == 6){x$ids <- paste(surname(x$apellido), c(x$legislatura+1), x$camara, x$sexo)} # legislatura posterior y un solo apellido
    y$ids <- paste(y$legislator, y$legislature, y$chamber, y$sex)
    out <-
        merge(y, x[, c("ids", "politico", "partido")], by = "ids", all.x = TRUE, sort = FALSE)
    # u <- which(names(out) %in% c("politico", "partido"))
    # names(out)[u] <- paste(names(out)[u], step, sep = "_")
    out
}

surname <- function(B){
    j <- strsplit(B, " ")
    j2 <- sapply(j, "[", 1)
    ubic <- which(lengths(j) > 2)
    j2[ubic] <- B[ubic]
    j2
}

#aux  <- function(x){ifelse(!is.na(unique(x)[1]), unique(x)[1], ifelse(length(unique(x)) > 1, unique(x)[2], NA))}
#aux2 <- function(x){ifelse(length(unique(x)) == 1 && is.na(unique(x)), NA, which(!is.na(x))[1])}

acron <- function(x){
    x. <- merge(x, partidos_uy[, c("Partido", "Sigla")], by.x = "party",by.y = "Partido", all.x = TRUE, sort = FALSE)
    names(x.)[which(names(x.) == "Sigla")] <- "party_acron"
    tibble::as_tibble(x.)
    #x.[,c(2:8, 10, 1, 12, 11)] %>% tibble::as_tibble()
}

sec_ <- c("legislator", "legislature", "chamber", "date","id", "speech", "sex", "legislator2", "party", "party_acron", "indicator", "words")

out.cat <- function(out, name, contiene){
    proto <- sort(unique(out$politico))
    pol <- paste0(c("", proto), "\n")
    cat("\n", can(x = proto, name = name, contiene = contiene), "\n")
    cat(pol, "\n\n")
}

can <- function(x, name, contiene){
    if(length(x) == 0){
        "No se encontraron politicos con ese nombre..."
    } else {
        if(nchar(paste(name, collapse = ""))  == 1){
            paste0("Los politicos encontrados con apellido", ifelse(contiene, " que contiene la letra '", " iniciado en '"), toupper(name) ,"' son:")
        } else {
            ifelse(length(x) == 1,
                   "El politico encontrado con ese nombre es:",
                   "Los politicos encontrados con ese nombre son:")
        }
    }
}

buscar <- function(dat, nombre, contiene){
    nombre <- tolower(nombre) %>% chartr("\u00e1\u00e9\u00ed\u00f3\u00fa","aeiou", .)
    if(!contiene){nombre <- paste0("^", nombre)}
    u <- list()
    for(i in 1:length(nombre)){
        if(contiene){
            u[[i]] <- which(stringr::str_detect(string = dat, pattern = nombre[i]))
        }else{
            u[[i]] <- stringr::str_which(string = dat, pattern = nombre[i])
        }
    }
    politicos[unique(unlist(u)),]
}



