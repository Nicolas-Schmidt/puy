#' @title Busqueda rapida de politrcios por el nombre
#' @description Permite hacer una busqueda rapida de politico en la base de datos \code{puy::politicos}
#' @param nombre nombre del politico
#' @return data.frame
#' @details La busqueda implementa unaexpresion regular que busca en la base de politicos a aquellos que comienzan con
#'     el valor ingresado en \code{nombre}. Es importante tener presente que los nombres de los politicos en la base
#'     tienen la siguiente estructura: APELLIDO, Nombre. No es necesario respetar el uso de mayusculas o minusculas pero si
#'     la secuencia del nombre tal cual esta en la base para obtener un resultado satisfactorio.
#' @examples
#' politico(nombre = "Mujica")
#' politico(nombre = "Mujica Cordano")
#' @export



politico <- function(nombre = character()){

    nombre <- paste0("^", tolower(nombre))
    dat <- politicos
    dat$pol <- tolower(dat$politico)
    out <- politicos[stringr::str_which(string = dat$pol, pattern = nombre),]
    out.cat(out)
    tibble::as_tibble(out)


}
