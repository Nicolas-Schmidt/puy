#' @title Adapta base de datos depliticos para pegar con speech
#' @description Adapta base de datos depliticos para pegar con speech
#' @param speech diario de sesion en formato data.frame del paquete \code{speech}.
#' @return data.frame
#' @examples
#' library(speech)
#' url <- "http://bit.ly/35AUVF4"
#' text <- speech::speech_build(file = url, compiler = TRUE)
#' text <- speech::speech_legis_replace(tidy_speech = text, old = "GOI", new = "GOÑI")
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
    for(i in 1:6){match1[[i]] <- step(B, dat, i)[,8:9]}
    voi <- base::Reduce(function(...) cbind(...), match1 )
    dat$legislator2 <- apply(voi[, seq(1,12, 2)], 1, aux)
    dat$party <- apply(voi[, seq(2,12, 2)], 1, aux)
    dat$indicator <- apply(voi[, seq(1,12, 2)], 1, aux2)
    invisible(dat)

}

