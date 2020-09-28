#' @title Nombre de los politicos uruguayos
#' @description Proporciona la frecuencia de nombres de los politicos uruguayos
#' @return data.frame con tres variables:
#'      \itemize{
#'             \item{\code{nombre}: nombre de pila del legislador}
#'             \item{\code{cantidad}: cantidad de veres que aparece ese nombre}
#'             \item{\code{porcentaje}: porcentaje de veses que aparece ese nombre}
#'            }
#' @examples
#' puy_nombres()
#' @export

puy_nombres <- function(){

    politicos["legislador2"] %>%
        split(.$legislador2) %>%
        lapply(unique) %>%
        do.call(rbind,.) %>%
        tibble::deframe() %>%
        stringr::str_extract_all(pattern = "([A-Z]{1}[a-z]{1,})") %>%
        sapply(., paste, collapse = " ") %>%
        data.frame(nombre = .) %>%
        dplyr::group_by(nombre) %>%
        dplyr::summarise(cantidad = n()) %>%
        dplyr::arrange(-cantidad) %>%
        dplyr::ungroup() %>%
        dplyr::mutate(porcentaje = round(cantidad / sum(cantidad) * 100, 2)) %>%
        data.table::as.data.table()

}
