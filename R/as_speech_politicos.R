#' @title Adapta base de datos depliticos para pegar con speech
#' @description Adapta base de datos depliticos para pegar con speech
#' @param speech diario de sesion en formato data.frame del paquete \code{speech}.
#' @return data.frame de entrada al que se le agregan 3 variables:
#'      \itemize{
#'             \item{\code{legislator2}: Nombre completo del legislador/a}
#'             \item{\code{party}: partido politico al que pertenece el legislador/a en ese momento}
#'             \item{\code{indicator}: un indicador de calidad del merge entre el diario de sesion y la base de politicos. Puede asumir los siguientres valores:}
#'                  \itemize{
#'                  \item{1 - Match perfecto (nombre del legislador/a, legislatura, caamara y sexo)}
#'                  \item{2 - Match parcial (igual al anterior pero solo con el primer apellido del legislador en la base de politicos. Sucede que mucahs veces en los diarios de sesion no aparece el legislador con ambos apellidos y en la base de politicos si.}
#'                  \item{3 - Match parcial (igual que el valor 1 pero cambiando la identificacion de legislatura para atras en una unidad)}
#'                  \item{4 - Match parcial (igual que el valor 1 pero cambiando la identificacion de legislatura para adelante en una unidad)}
#'                  \item{5 - Match parcial debil (un solo apellido con la legislatura anterior)}
#'                  \item{6 - Match parcial debil (un solo apellido con la legislatura posterior)}
#'                   }
#'
#'            }
#' @examples
#' library(speech)
#' url <- "http://bit.ly/35AUVF4"
#' text <- speech::speech_build(file = url, compiler = TRUE)
#' text <- speech::speech_legis_replace(tidy_speech = text, old = "GOI", new = "GONI")
#' floor_speech <- as_speech_politicos(speech = text)
#' @export


as_speech_politicos <- function(speech){

    dat <- speech
    # acá hay que filtrar la base de politicos solo de legisladores
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
    invisible(dat)

}

