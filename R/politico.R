#' @title Busqueda rapida de politrcios por el nombre
#' @description Permite hacer una busqueda rapida de politico en la base de datos \code{puy::politicos}
#' @param nombre nombre del politico
#' @return data.frame
#' @details La busqueda implementa una expresion regular que busca en la base de politicos a aquellos legisladores y legisladoras
#'     que comienzan con el valor ingresado en \code{nombre}. Es importante tener presente que los nombres de los politicos en la base
#'     tienen la siguiente estructura: 'APELLIDO, Nombre'. No es necesario respetar el uso de mayusculas o minusculas pero si
#'     la secuencia del nombre tal cual esta en la base para obtener un resultado satisfactorio. Por ejemplo, si quiere buscar a Tabare Vazques
#'     y utiliza \code{politico(nombre = "Tabare Vazquez")} no va a obtener resultados como si hiciera: \code{politico(nombre = "Vazquez")} o
#'     \code{politico(nombre = "Vazquez, Tabare")}.
#' @examples
#' politico(nombre = "Mujica")
#' politico(nombre = "Mujica Cordano")
#'
#' politico(nombre = "Larrañaga")
#' politico(nombre = "L") # todos los politicos en los que el primer apellido comienza con la letra 'L'
#' @export



politico <- function(nombre = character()){

    nombre <- tolower(nombre) %>% chartr("\u00e1\u00e9\u00ed\u00f3\u00fa","aeiou", .)
    nombre <- paste0("^", nombre)
    dat <- politicos
    dat$pol <- tolower(dat$politico)
    out <- politicos[stringr::str_which(string = dat$pol, pattern = nombre),]
    out.cat(out)
    tibble::as_tibble(out)


}
