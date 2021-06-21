#' @title Busqueda rapida de politrcios por el nombre
#' @description Permite hacer una busqueda rapida de politico en la base de datos \code{puy::politicos}
#' @param nombre nombre del politico
#' @param contiene valor logico que indica si se desea buscar el valor ingresado en \code{nombre} como parte del apellido o del
#'     nombre de un politico. Por defecto es \code{FALSE}, esto quiere decir que la busqueda que se inicia por defeto es por inicio
#'     de los caracteres ingresado en \code{nombre}.
#' @return data.frame
#' @details La busqueda implementa una expresion regular que busca en la base de politicos a aquellos legisladores y legisladoras
#'     que comienzan con el valor ingresado en \code{nombre}. Es importante tener presente que los nombres de los politicos en la base
#'     tienen la siguiente estructura: 'APELLIDO, Nombre'. No es necesario respetar el uso de mayusculas o minusculas pero si
#'     la secuencia del nombre tal cual esta en la base para obtener un resultado satisfactorio. Por ejemplo, si quiere buscar a Tabare Vazques
#'     y utiliza \code{politico(nombre = "Tabare Vazquez")} no va a obtener resultados como si hiciera: \code{politico(nombre = "Vazquez")} o
#'     \code{politico(nombre = "Vazquez, Tabare")}.
#'
#' @examples
#' politico(nombre = "Mujica")
#' politico(nombre = "Mujica Cordano")
#'
#' politico(nombre = "Larrañaga")
#' politico(nombre = "L") # todos los politicos en los que el primer apellido comienza con la letra 'L'
#'
#' politico(nombre = "Lacalle")
#' politico(nombre = "Lacalle", contiene = TRUE)
#'
#' @export

politico <- function(nombre = character(), contiene = FALSE){
    dat <- politicos
    dat$pol <- tolower(dat$politico)
    out <- buscar(dat = dat$pol, nombre = nombre, contiene = contiene)
    out.cat(out = out, name = nombre, contiene = contiene)
    tibble::as_tibble(out)


}
