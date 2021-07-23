#' politicos
#'
#' Conjunto de datos de politicos uruguayos que ocuparon cargos politicos entre 1830 y 2020. Incluye datos de:
#'    \itemize{
#'             \item{Presidentes y Vicepresidentes: 1830 - 2020}
#'             \item{Legisladores (Diputados y Senadores): 1830 - 2020}
#'             \item{Ministros de Estado: 1904 - 2020}
#'             \item{Intendentes: 1925 - 2020}
#'             \item{Alcaldes y Concejales: 2010 - 2020}
#'             \item{Ministros Corte Electoral: 1985 - 2020}
#'             \item{Candidato Presidente y Vicepresidente: 1958 - 2020}
#'             }
#'
#'    Las variables que tiene este conjunto de datos son:
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
#' @format data.frame con 10315 filas y 9 columnas.
#' @details En las variables \code{fecha_inicio} y \code{fecha_fin} cuando se tiene solo el anio por convencion se le marca la fecha "1 de marzo de ...". La fuente principal de datos de legisladores es el texto: 'Parlamentarios Uruguayos 1830-2005' que fue digitalizado. Sobre esta primer estructura se hicieron muchas correcciones a partir de las Tablas cronologicas y de los Anales del Senado.
#'          Se incorporo a la base los datos de candidaturas presidenciales y de precandidaturas presidenciales (elecciones internas) a los efectos de tener informacion adicional sobre las carreras politicas, aunque la pieza clave del origen de la carrera politica radica en las candidaturas que aparecen en las hojas de votacion a los distintos cargos. Estos politicos son la unica excepcion en la base que en esas instancias no ocuparon ningun cargo sino que se postularon.
#'          Para ahondar en los distintos problemas para abordar el fenomeno de carreras politicas en Uruguay ver:
#'
#'          Chasquetti, Daniel, Buquet, Daniel (2018) "Parliamentary style. Portfolio allocation: Uruguay (1967–2015)" en Camerlo, Marcelo y Cecilia Martínez Gallardo (eds.). Government Formation and Minster Turnover in Presidential Cabinets. Comparative Analysis in the Americas. Routledge. pp. 67-89.
#'
#'          Chasquetti, Daniel, Buquet, Daniel, Cardarello, Antonio (2013) "La designacion de gabinetes en Uruguay: estrategia legislativa, jerarquia de los ministerios y afiliación partidaria de los ministros", América Latina Hoy 64:15-40
#'
#'          Chasquetti, Daniel (2008) "Parlamento y carreras legislativas en Uruguay. Un estudio sobre reglas, partidos y legisladores en las camaras", FCS-Udelar, Montevideo.
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
#'
#' \insertRef{departamental}{puy}
#'
NULL
