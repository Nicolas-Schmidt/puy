% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_party.R
\name{add_party}
\alias{add_party}
\title{Agrega etiqueta partidaria a la base de datos generada por \code{\link[speech]{speech_build}}.}
\usage{
add_party(speech)
}
\arguments{
\item{speech}{diario de sesion en formato data.frame del paquete \code{speech}.}
}
\value{
data.frame de entrada al que se le agregan 5 variables:
     \itemize{
            \item{\code{legislator2}: Nombre completo del legislador/a en el formato 'APELLIDO, Nombre'}
            \item{\code{party}: Partido politico al que pertenece el legislador/a en ese momento (legislatura)}
            \item{\code{party_acron}: Sigla de partido politico al que pertenece el legislador/a en ese momento}
            \item{\code{indicator}: un indicador de calidad del merge entre el diario de sesion y la base de politicos. Puede asumir los siguientres valores:}
                 \enumerate{
                 \item{Match perfecto (nombre del legislador/a, legislatura, camara y sexo)}
                 \item{Match parcial (igual al anterior pero solo con el primer apellido del legislador en la base de politicos. Sucede que mucahs veces en los diarios de sesion no aparece el legislador con ambos apellidos y en la base de politicos si.}
                 \item{Match parcial (igual que el valor 1 pero cambiando la identificacion de legislatura para atras en una unidad)}
                 \item{Match parcial (igual que el valor 1 pero cambiando la identificacion de legislatura para adelante en una unidad)}
                 \item{Match parcial debil (un solo apellido con la legislatura anterior)}
                 \item{Match parcial debil (un solo apellido con la legislatura posterior)}
                  }
           \item{\code{words}: cantidad de palabras.}
           }
}
\description{
Adapta base de datos de politicos para pegar con \code{speech} (compilacion de diarios de sesion del parlamento de formato PDF
    a \code{data.frame}). Es particularmente relevante para tener la filiacion partidaria de los legisladores y de ese modo poder hacer analisis
    de contenido o de posicionamiento ideologico (e.g. text scaling) con el corte partidario.
}
\details{
Cuando se va a hacer el merge y se hacen correcciones a mano con \code{speech::speech_legis_replace()} sobre la base de speech
    hay que evitar los tildes. Tenga en cuenta que en muchos diarios de sesion no se pone el apellido completo del legisaldor o legisladora,
    si en la misma sesion hay dos legisladores del mismo sexo con el mismo apellido se van a cargar los dos y va a duplicar los los valores de
    las demas variables. Por esta razon es necesario que se hagan controles manuales sobre el match. En el testeo de este posible problema los errores
    de este tipo fueron realmente minimos. Para esos casos recuerde que puede editar el nombre del legislador con funciones nativas de R o con
    \code{speech::speech_legis_replace()}.
}
\examples{
\donttest{
#library(speech)
#url <- "http://bit.ly/35AUVF4"
#text <- speech::speech_build(file = url, compiler = TRUE)
#floor_speech <- add_party(speech = text)
}
}
