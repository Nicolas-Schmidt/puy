#' @title Busqueda rapida de politrcios por el nombre
#' @description Permite hacer una busqueda rapida de politico en la base de datos \code{puy::politicos}
#' @param apellido nombre del politico
#' @return data.frame
#' @details La busqueda implementa una expresion regular que busca en la base de politicos a aquellos legisladores y legisladoras
#'     que comienzan con el valor ingresado en \code{apellido}. Es importante tener presente que los nombres de los politicos en la base
#'     tienen la siguiente estructura: 'APELLIDO, Nombre'. No es necesario respetar el uso de mayusculas o minusculas pero si
#'     la secuencia del nombre tal cual esta en la base para obtener un resultado satisfactorio. Por ejemplo, si quiere buscar a Tabare Vazques
#'     y utiliza \code{politico(nombre = "Tabare Vazquez")} no va a obtener resultados como si hiciera: \code{politico(nombre = "Vazquez")} o
#'     \code{politico(nombre = "Vazquez, Tabare")}.
#' @examples
#' politico(apellido = "Mujica")
#' politico(apellido = "Mujica Cordano")
#' @export



politico <- function(apellido = character()){

    nombre <- tolower(apellido) %>% chartr("\u00e1\u00e9\u00ed\u00f3\u00fa","aeiou", .)
    nombre <- paste0("^", nombre)
    dat <- politicos
    dat$pol <- tolower(dat$politico)
    out <- politicos[stringr::str_which(string = dat$pol, pattern = nombre),]
    out.cat(out)
    tibble::as_tibble(out)


}
