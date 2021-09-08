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
#'     y utiliza \code{buscar_puy(nombre = "Tabare Vazquez")} no va a obtener resultados como si hiciera: \code{buscar_puy(nombre = "Vazquez")} o
#'     \code{buscar_puy(nombre = "Vazquez, Tabare")}.
#'
#' @examples
#' buscar_puy(nombre = "Mujica")
#' buscar_puy(nombre = "Mujica Cordano")
#'
#' buscar_puy(nombre = "Larrañaga")
#' # todos los politicos en los que el primer apellido comienza con la letra 'L'
#' buscar_puy(nombre = "L")
#'
#' buscar_puy(nombre = "Lacalle")
#' buscar_puy(nombre = "Lacalle", contiene = TRUE)
#'
#' @export

buscar_puy <- function(nombre = character(), contiene = FALSE){
    dat <- puy::politicos
    dat$pol <- tolower(dat$politico)
    out <- buscar(dat = dat$pol, nombre = nombre, contiene = contiene)
    out.cat(out = out, name = nombre, contiene = contiene)
    tibble::as_tibble(out)


}
