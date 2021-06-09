#' @title Adapta base de datos de pliticos uruguayos para pegar con base de datos generada por \code{speech::speech_build()}.
#' @description Adapta base de datos de pliticos para pegar con speech. Es relevante para tener la filiacion partidaria de los
#'     legisladores y poder hacer analisis con el corte partidario.
#' @param speech diario de sesion en formato data.frame del paquete \code{speech}.
#' @return data.frame de entrada al que se le agregan 4 variables:
#'      \itemize{
#'             \item{\code{legislator2}: Nombre completo del legislador/a}
#'             \item{\code{party}: Partido politico al que pertenece el legislador/a en ese momento}
#'             \item{\code{party_acron}: sigla de partido politico al que pertenece el legislador/a en ese momento}
#'             \item{\code{indicator}: un indicador de calidad del merge entre el diario de sesion y la base de politicos. Puede asumir los siguientres valores:}
#'                  \itemize{
#'                  \item{1 - Match perfecto (nombre del legislador/a, legislatura, camara y sexo)}
#'                  \item{2 - Match parcial (igual al anterior pero solo con el primer apellido del legislador en la base de politicos. Sucede que mucahs veces en los diarios de sesion no aparece el legislador con ambos apellidos y en la base de politicos si.}
#'                  \item{3 - Match parcial (igual que el valor 1 pero cambiando la identificacion de legislatura para atras en una unidad)}
#'                  \item{4 - Match parcial (igual que el valor 1 pero cambiando la identificacion de legislatura para adelante en una unidad)}
#'                  \item{5 - Match parcial debil (un solo apellido con la legislatura anterior)}
#'                  \item{6 - Match parcial debil (un solo apellido con la legislatura posterior)}
#'                   }
#'
#'            }
#' @details Cuando se va a hacer el merge y se hacen correcciones a mano con \code{speech::speech_legis_replace()} sobre la base de speech
#'     hay que evitar las 'enies' y los tildes. La base de polílicos cuando se exporta genera las 'enies' y en la variable \code{legislator2}
#'     que se genera con esta funcion las enies van a aparecer pero el proceso de unios de bases no utiliza esos caracteres por lo que si decide
#'     utilizarlos no va a ser posible ninguno de los match posibles que se describen para la variable \code{indicator}.
#' @examples
#' \donttest{
#' #library(speech)
#' #url <- "http://bit.ly/35AUVF4"
#' #text <- speech::speech_build(file = url, compiler = TRUE)
#' #floor_speech <- as_speech_politicos(speech = text)
#' }
#' @export


as_speech_politicos <- function(speech){

    dat <- speech
    politicos   <- subset(politicos, subset = politicos$cargo %in% c("Diputados", "Senado"))
    b1          <- politicos
    b1$apellido <- stringr::str_extract(b1$politico, pattern = "[A-Z. ]{2,}")
    b1$camara   <- ifelse(b1$cargo == "Senado", "CAMARA DE SENADORES", ifelse(b1$cargo == "Diputados", "CAMARA DE REPRESENTANTES", NA))
    b2          <- b1
    b2$camara   <- "ASAMBLEA GENERAL"
    b3          <- b2
    b2$camara   <- "COMISION PERMANENTE"
    B           <- rbind(b1, b2, b3)
    match1 <- list()
    for(i in 1:6){match1[[i]] <- step(B, dat, i)[,c(8:9)]}
    voi <- base::Reduce(function(...) cbind(...), match1)
    dat$legislator2 <- apply(voi[, seq(1,ncol(voi), 2)], 1, aux)
    dat$party       <- apply(voi[, seq(2,ncol(voi), 2)], 1, aux)
    dat$indicator   <- apply(voi[, seq(1,ncol(voi), 2)], 1, aux2)
    dat <- acron(dat)
    invisible(dat[order(dat$legislator),])

}

