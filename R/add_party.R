#' @title Agrega etiqueta partidaria a la base de datos generada por \code{speech::speech_build()}.
#' @description Adapta base de datos de politicos para pegar con \code{speech} (compilacion de diarios de sesion del parlamento de formato PDF
#'     a \code{data.frame}). Es particularmente relevante para tener la filiacion partidaria de los legisladores y de ese modo poder hacer analisis
#'     de contenido o de posicionamiento ideologico (e.g. text scaling) con el corte partidario.
#' @param speech diario de sesion en formato data.frame del paquete \code{speech}.
#' @return data.frame de entrada al que se le agregan 5 variables:
#'      \itemize{
#'             \item{\code{legislator2}: Nombre completo del legislador/a en el formato 'APELLIDO, Nombre'}
#'             \item{\code{party}: Partido politico al que pertenece el legislador/a en ese momento (legislatura)}
#'             \item{\code{party_acron}: Sigla de partido politico al que pertenece el legislador/a en ese momento}
#'             \item{\code{indicator}: un indicador de calidad del merge entre el diario de sesion y la base de politicos. Puede asumir los siguientres valores:}
#'                  \itemize{
#'                  \item{1 - Match perfecto (nombre del legislador/a, legislatura, camara y sexo)}
#'                  \item{2 - Match parcial (igual al anterior pero solo con el primer apellido del legislador en la base de politicos. Sucede que mucahs veces en los diarios de sesion no aparece el legislador con ambos apellidos y en la base de politicos si.}
#'                  \item{3 - Match parcial (igual que el valor 1 pero cambiando la identificacion de legislatura para atras en una unidad)}
#'                  \item{4 - Match parcial (igual que el valor 1 pero cambiando la identificacion de legislatura para adelante en una unidad)}
#'                  \item{5 - Match parcial debil (un solo apellido con la legislatura anterior)}
#'                  \item{6 - Match parcial debil (un solo apellido con la legislatura posterior)}
#'                   }
#'            \item{\code{words}: cantidad de palabras.}
#'            }
#' @details Cuando se va a hacer el merge y se hacen correcciones a mano con \code{speech::speech_legis_replace()} sobre la base de speech
#'     hay que evitar los tildes. Tenga en cuenta que en muchos diarios de sesion no se pone el apellido completo del legisaldor o legisladora,
#'     si en la misma sesion hay dos legisladores del mismo sexo con el mismo apellido se van a cargar los dos y va a duplicar los los valores de
#'     las demas variables. Por esta razon es necesario que se hagan controles manuales sobre el match. En el testeo de este posible problema los errores
#'     de este tipo fueron realmente minimos. Para esos casos recuerde que puede editar el nombre del legislador con funciones nativas de R o con
#'     \code{speech::speech_legis_replace()}.
#' @examples
#' \donttest{
#' #library(speech)
#' #url <- "http://bit.ly/35AUVF4"
#' #text <- speech::speech_build(file = url, compiler = TRUE)
#' #floor_speech <- add_party(speech = text)
#' }
#' @export

add_party <- function(speech){

    dat <- speech
    politicos   <- subset(politicos, subset = politicos$cargo %in% c("Diputado", "Senador"))
    b1          <- politicos
    b1$apellido <- stringr::str_extract(b1$politico, pattern = "[A-Z\u00D1. ]{2,}")
    b1$camara   <- ifelse(b1$cargo == "Senador", "CAMARA DE SENADORES", ifelse(b1$cargo == "Diputado", "CAMARA DE REPRESENTANTES", NA))
    b2          <- b1
    b2$camara   <- "ASAMBLEA GENERAL"
    b3          <- b2
    b2$camara   <- "COMISION PERMANENTE"
    B           <- rbind(b1, b2, b3)
    match1 <- list()
    j <- 1L
    for(i in 1:6){
        if(j >= 1){
            match1[[i]] <- step(B, dat, i)
            match1[[i]]$indicator <- ifelse(is.na(match1[[i]]$politico), NA, i)
            dat <- match1[[i]][is.na(match1[[i]]$politico), 1:(ncol(match1[[i]])-3)]
            j   <- nrow(dat)
        }
    }
    dat <- unique(do.call("rbind", match1))
    names(dat)[names(dat) == "partido"] <- "party"
    names(dat)[names(dat) == "politico"] <- "legislator2"
    dat <- dat[order(dat$legislator2), ]
    u <- which(duplicated(dat$legislator) & is.na(dat$party))
    if(length(u) > 0){dat <- dat[-u,]}
    dat <- acron(dat)
    dat$words <- speech::speech_word_count(dat$speech)
    dat <- dat[,sec_]
    invisible(dat[order(dat$legislator),])

}
