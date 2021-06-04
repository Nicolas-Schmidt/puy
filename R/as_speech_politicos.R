#' @title Adapta base de datos depliticos para pegar con speech
#' @description Adapta base de datos depliticos para pegar con speech
#' @param floor_speech diario de sesion en formato data.frame del paquete \code{speech}.
#' @return data.frame
#' @examples
#' library(speech)
#' url <- "http://bit.ly/35AUVF4"
#' text <- speech::speech_build(file = url)
#' as_speech_politicos(floor_speech = text)
#' @export

as_speech_politicos <- function(floor_speech){

    politicos %>%
        rename(legislator_nc = legislador2,
               legislature   = legislatura,
               party         = partido) %>%
        transform(legislator = stringr::str_extract(legislator_nc, pattern = "[A-Z. ]{2,}")) %>%
        subset(., select = c(legislator_nc, legislature, party, legislator)) %>%
        merge(floor_speech, ., by = c("legislator", "legislature")) %>%
        tibble::as_tibble()
}


#### ALGORITMO DE MERGE #####
# -------  step 1 puro
# -------  step 2 primer apellido
# -------  step 3 legislatura anterior



url_speech <- "https://parlamento.gub.uy/documentosyleyes/documentos/diario-de-sesion/senadores/2094/IMG/0?width=800&height=600&hl=en_US1&iframe=true&rel=nofollow"
floor_speech <- speech::speech_build(file = url_speech, compiler = TRUE)

str(floor_speech)

puto <-
l %>%
    rename(legislator_nc = legislador2,
           legislature   = legislatura,
           party         = partido) %>%
    transform(legislator = stringr::str_extract(legislator_nc, pattern = "[A-Z. ]{2,}")) %>%
    subset(., select = c(legislator_nc, legislature, party, legislator)) %>%
    merge(floor_speech, ., by = c("legislator", "legislature"), all.x = TRUE) %>%
    tibble::as_tibble()

View(puto)


floor_speech_party <- puy::as_speech_politicos(floor_speech)

str(floor_speech_party)

