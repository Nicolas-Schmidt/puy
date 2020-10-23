#' @title Adapta base de datos depliticos para pegar con speech
#' @description Adapta base de datos depliticos para pegar con speech
#' @param floor_speech diario de sesion en formato data.frame del paquete \code{speech}.
#' @return data.frame
#' @examples
#' as_speech_politicos()
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
