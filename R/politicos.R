#' politicos
#'
#' Contiene el periodo y el cargo que ocupo un politico uruguayo desde 1830 hasta 2020.
#'
#'\describe{
#'    \item{politico}{Nombre completo del politico en el formato: 'APELLIDO, Nombre'}
#'    \item{partido}{Partido al que pertenece el politico en el cargo.}
#'    \item{fecha_inicio}{Fecha de inicio en el que comienza la gestion en el cargo.}
#'    \item{fecha_fin}{Fecha de fin en la que finaliza la gestion en el cargo.}
#'    \item{legislatura}{Legislatura en la que ocupa el cargo. Esta variable es para los legisladores unicamente.}
#'    \item{cargo}{Tipo de cargo.}
#'    \item{status}{Si es Titular, Suplente, Nominal...}
#'    \item{circunscripcion}{Distrito al que pertenece el legislador.}
#'    \item{sexo}{Sexo. Variable numerica: masculino = 1, femenino = 0.}
#' }
#' @docType data
#' @keywords datasets
#' @name politicos
#' @usage data(politicos)
#' @format data.frame con ... filas y 7 columnas.
#' @details En las variables \code{fecha_inicio} y \code{fecha_fin} cuando se tiene solo el anio por convencion se le marca la fecha "1 de marzo de ...". La fuente principal de datos de legisladores es el texto: 'Parlamentarios Uruguayos 1830-2005' que fue digitalizado.
#'
#'
#'
#' @references
#' \insertRef{legislativo2}{puy}
#'
#' \insertRef{legislativo}{puy}
#'
#' \insertRef{musso}{puy}
#'
#' \insertRef{oddone}{puy}
NULL
