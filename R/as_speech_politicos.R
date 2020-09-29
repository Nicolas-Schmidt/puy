#' @title Adapta base de datos depliticos para pegar con speech
#' @description Adapta base de datos depliticos para pegar con speech
#' @return data.frame
#' @examples
#' as_speech_politicos()
#' @export

as_speech_politicos <- function(){
    politicos %>%
        rename(legislator_nc = legislador2,
               legislature   = legislatura,
               party         = partido) %>%
        mutate(
            legislature = as.character(legislature),
            legislator = stringr::str_extract(legislator_nc, pattern = "[A-Z. ]{2,}")
        ) %>%
        select(legislator_nc, legislature, party, legislator)
}
