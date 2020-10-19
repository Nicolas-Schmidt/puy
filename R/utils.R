#' @importFrom magrittr %>%
#' @importFrom dplyr group_by summarise ungroup distinct summarize n rename select

vars <- c("politicos", "legislador2", "nombre", "cantidad","party", "legislator",
          "partido", "legislator_nc", "legislature", "legislatura")

if(getRversion() >= "2.15.1"){
    utils::globalVariables(c('.', vars))
    utils::suppressForeignCheck(c('.'))
}

# check as_speech
