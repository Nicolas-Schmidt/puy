#' @importFrom magrittr %>%
#' @importFrom tibble as_tibble

vars <- c("politicos", "legislador2","party", "legislator",
          "partido", "legislator_nc", "legislature", "legislatura")

if(getRversion() >= "2.15.1"){
    utils::globalVariables(c('.', vars))
    utils::suppressForeignCheck(c('.'))
}

step <- function(x, y, step){

    if(step == 1){x$id <- paste(x$apellido,          x$legislatura,      x$camara, x$sexo)} # match completo
    #if(step == 2){x$id <- paste(x$apellido,          x$legislatura,                x$sexo)} # sin camara
    if(step == 2){x$id <- paste(surname(x$apellido), x$legislatura,      x$camara, x$sexo)} # un solo apellido
    if(step == 3){x$id <- paste(x$apellido,          c(x$legislatura-1), x$camara, x$sexo)} # legislatura anterior
    if(step == 4){x$id <- paste(x$apellido,          c(x$legislatura+1), x$camara, x$sexo)} # legislatura posterior
    if(step == 5){x$id <- paste(surname(x$apellido), c(x$legislatura-1), x$camara, x$sexo)} # legislatura anterior y un solo apellido
    if(step == 6){x$id <- paste(surname(x$apellido), c(x$legislatura+1), x$camara, x$sexo)} # legislatura posterior y un solo apellido
    y$id <- paste(y$legislator, y$legislature, y$chamber, y$sex)
    out <-
        merge(y, x[, c("id", "politico", "partido")], by = "id", all.x = TRUE) %>%
        tibble::as_tibble()
    names(out)[7:8] <- paste(names(out)[7:8], step, sep = "_")
    out
}

surname <- function(B){
    j <- strsplit(B, " ")
    j2 <- sapply(j, "[", 1)
    ubic <- which(lengths(j) > 2)
    j2[ubic] <- B[ubic]
    j2

}
aux <- function(x){ifelse(!is.na(unique(x)[1]), unique(x)[1], ifelse(length(unique(x)) > 1, unique(x)[2], NA))}
aux2 <- function(x){ifelse(length(unique(x)) == 1 && is.na(unique(x)), NA, which(!is.na(x))[1])}
acron <- function(x){
    x. <- merge(x, Boreluy::partidos_uy[, c("Partido", "Sigla")], by.x = "party",by.y = "Partido", all.x = TRUE)
    names(x.)[11] <- "party_acron"
    x.[, c(2:9, 1, 11, 10)] %>% tibble::as_tibble()
    }









