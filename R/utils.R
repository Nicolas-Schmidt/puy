#' @importFrom magrittr %>%
#' @importFrom dplyr group_by mutate summarise ungroup distinct summarize n

vars <- c("politicos", "legislador2", "nombre", "cantidad")

if(getRversion() >= "2.15.1"){
    utils::globalVariables(c('.', vars))
    utils::suppressForeignCheck(c('.'))
}
