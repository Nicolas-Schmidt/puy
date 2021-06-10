
<!-- README.md is generated from README.Rmd. Please edit that file -->

## puy: políticos uruguayos

*Nicolás Schmidt, Antonio Cardarello, Alfonso Castiglia, Fabricio
Carneiro, Diego Luján,
UMAD<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup>.*

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/puy)](https://CRAN.R-project.org/package=puy)
[![Project Status: Active â€“ The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-green.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![](https://img.shields.io/badge/devel%20version-0.1.0.08-orange.svg)](https://github.com/Nicolas-Schmidt/puy)
[![R-CMD-check](https://github.com/Nicolas-Schmidt/puy/workflows/R-CMD-check/badge.svg)](https://github.com/Nicolas-Schmidt/puy/actions)
<!-- badges: end -->

### Descripción

Contiene un conjunto de datos original de politicos uruguayos que
ocuparon diversos cargos publicos: Presidentes, ministros, legisladores,
alcaldes, concejales, ministros de corte electoral. Esta base de datos
permite seguir la trayectoria de un politico a lo largo de su carrera y
los distintos cargos que fue ocupando. Asimismo, es de gran utilidad
para tener la identificacion partidaria de los politicos en el tiempo
para poder empalmar con otros conjuntos de datos en donde la unidad es
el politico. El ejemplo inmediato de esto ultimo es la base de datos que
se genera a partir de los diarios de sesion del parlamento con el
paquete speech.

#### Conjuntos de datos

#### `politicos`

| Variable          | Descripción                                                                              |
| ----------------- | ---------------------------------------------------------------------------------------- |
| `politico`        | Partido al que pertenece el politico en el cargo.                                        |
| `partido`         | Partido al que pertenece el politico en el cargo.                                        |
| `fecha_inicio`    | Fecha de inicio en el que comienza la gestión en el cargo.                               |
| `fecha_inicio`    | Fecha de fin en la que finaliza la gestión en el cargo.                                  |
| `legislatura`     | Legislatura en la que ocupa el cargo. Esta variable es para los legisladores unicamente. |
| `cargo`           | Tipo de cargo.                                                                           |
| `status`          | Si es Titula, Suplente, Nominal…                                                         |
| `circunscripcion` | Distrito al que pertenece el legislador.                                                 |
| `sexo`            | Sexo.                                                                                    |

Actualmente la base cuenta con la siguiente informacion:

| Políticos             | Periodo     |
| --------------------- | ----------- |
| Legisladores          | 1830 - 2020 |
| Ministros             | 1904 - 2020 |
| Alcaldes y Concejales | 2010 - 2020 |
| Corte Electoral       | 1985 - 2020 |

#### `legislaturas`

| Variable    | Descripción                                         |
| ----------- | --------------------------------------------------- |
| legislatura | Número de la legislatura.                           |
| inicio      | Fecha de inicio de la legislatura.                  |
| fin         | Fecha de cierre de la legislatura                   |
| dias        | Cantidad de días que estuvo abierta la legislatura. |

#### Funciones

| Función        | Descripción |
| -------------- | ----------- |
| `as_speeh_puy` |             |

## Ejemplo

``` r
library(speech)
library(puy)
url <- "http://bit.ly/35AUVF4"
text <- speech::speech_build(file = url, compiler = TRUE)
text
#> # A tibble: 11 x 7
#>    legislator legislature chamber    date       id    speech                 sex
#>    <chr>            <dbl> <chr>      <date>     <chr> <chr>                <dbl>
#>  1 ABDALA              48 COMISION ~ 2019-09-17 35AU~ SEÑOR ABDALA. Voto ~     1
#>  2 ASTI                48 COMISION ~ 2019-09-17 35AU~ SEÑOR ASTI. Obviame~     1
#>  3 AVIAGA              48 COMISION ~ 2019-09-17 35AU~ SEÑORA AVIAGA. Pido~     0
#>  4 BORDABERRY          48 COMISION ~ 2019-09-17 35AU~ SEÑOR BORDABERRY. P~     1
#>  5 GOÑI                48 COMISION ~ 2019-09-17 35AU~ SEÑOR GOÑI. Pido la~     1
#>  6 LAZO                48 COMISION ~ 2019-09-17 35AU~ SEÑORA LAZO. Voto p~     0
#>  7 MAHIA               48 COMISION ~ 2019-09-17 35AU~ SEÑOR MAHIA. Pido l~     1
#>  8 MERONI              48 COMISION ~ 2019-09-17 35AU~ SEÑOR MERONI. Voto,~     1
#>  9 PEREYRA             48 COMISION ~ 2019-09-17 35AU~ SEÑORA PEREYRA. Con~     0
#> 10 TOURNE              48 COMISION ~ 2019-09-17 35AU~ SEÑORA TOURNE. Voy ~     0
#> 11 VIERA               48 COMISION ~ 2019-09-17 35AU~ SEÑOR VIERA. Voto p~     1

floor_speech <- as_speech_politicos(speech = text)
floor_speech
#> # A tibble: 11 x 12
#>    legislator legislature chamber  date       id     speech      sex legislator2
#>    <chr>            <dbl> <chr>    <date>     <chr>  <chr>     <dbl> <chr>      
#>  1 ABDALA              48 COMISIO~ 2019-09-17 35AUV~ SEÑOR AB~     1 ABDALA, Pa~
#>  2 ASTI                48 COMISIO~ 2019-09-17 35AUV~ SEÑOR AS~     1 ASTI, Alfr~
#>  3 AVIAGA              48 COMISIO~ 2019-09-17 35AUV~ SEÑORA A~     0 AVIAGA, Ca~
#>  4 BORDABERRY          48 COMISIO~ 2019-09-17 35AUV~ SEÑOR BO~     1 BORDABERRY~
#>  5 GOÑI                48 COMISIO~ 2019-09-17 35AUV~ SEÑOR GO~     1 GOÑI ROMER~
#>  6 LAZO                48 COMISIO~ 2019-09-17 35AUV~ SEÑORA L~     0 LAZO, Sand~
#>  7 MAHIA               48 COMISIO~ 2019-09-17 35AUV~ SEÑOR MA~     1 MAHIA, Jos~
#>  8 MERONI              48 COMISIO~ 2019-09-17 35AUV~ SEÑOR ME~     1 <NA>       
#>  9 PEREYRA             48 COMISIO~ 2019-09-17 35AUV~ SEÑORA P~     0 PEREYRA, S~
#> 10 TOURNE              48 COMISIO~ 2019-09-17 35AUV~ SEÑORA T~     0 TOURNE, Da~
#> 11 VIERA               48 COMISIO~ 2019-09-17 35AUV~ SEÑOR VI~     1 VIERA, Tab~
#> # ... with 4 more variables: party <chr>, party_acron <chr>, indicator <int>,
#> #   words <int>


str(floor_speech)
#> tibble[,12] [11 x 12] (S3: tbl_df/tbl/data.frame)
#>  $ legislator : chr [1:11] "ABDALA" "ASTI" "AVIAGA" "BORDABERRY" ...
#>  $ legislature: num [1:11] 48 48 48 48 48 48 48 48 48 48 ...
#>  $ chamber    : chr [1:11] "COMISION PERMANENTE" "COMISION PERMANENTE" "COMISION PERMANENTE" "COMISION PERMANENTE" ...
#>  $ date       : Date[1:11], format: "2019-09-17" "2019-09-17" ...
#>  $ id         : chr [1:11] "35AUVF4" "35AUVF4" "35AUVF4" "35AUVF4" ...
#>  $ speech     : chr [1:11] "SEÑOR ABDALA. Voto por la señora legisladora Daisy Tourné. Si me lo permite, voy a fundamentar el voto. Para ro"| __truncated__ "SEÑOR ASTI. Obviamente, es con mucho gusto y con mucha convicción que vamos a votar a nuestra querida y experim"| __truncated__ "SEÑORA AVIAGA. Pido la palabra. SEÑORA AVIAGA. En el mismo sentido, con mucho gusto vamos a acompañar la propue"| __truncated__ "SEÑOR BORDABERRY. Pido la palabra. SEÑOR BORDABERRY. Propongo a la señora legisladora Daisy Tourné como preside"| __truncated__ ...
#>  $ sex        : num [1:11] 1 1 0 1 1 0 1 1 0 0 ...
#>  $ legislator2: Named chr [1:11] "ABDALA, Pablo" "ASTI, Alfredo" "AVIAGA, Carol" "BORDABERRY, Pedro" ...
#>   ..- attr(*, "names")= chr [1:11] "1" "2" "3" "4" ...
#>  $ party      : Named chr [1:11] "Partido Nacional" "Frente Amplio" "Partido Nacional" "Partido Colorado" ...
#>   ..- attr(*, "names")= chr [1:11] "1" "2" "3" "4" ...
#>  $ party_acron: chr [1:11] "PN" "FA" "PN" "PC" ...
#>  $ indicator  : Named int [1:11] 1 1 1 1 2 3 1 NA 1 1 ...
#>   ..- attr(*, "names")= chr [1:11] "1" "2" "3" "4" ...
#>  $ words      : int [1:11] 400 46 107 963 100 103 128 12 12 111 ...

floor_speech[c(1,2,7:11)]
#> # A tibble: 11 x 7
#>    legislator legislature   sex legislator2      party     party_acron indicator
#>    <chr>            <dbl> <dbl> <chr>            <chr>     <chr>           <int>
#>  1 ABDALA              48     1 ABDALA, Pablo    Partido ~ PN                  1
#>  2 ASTI                48     1 ASTI, Alfredo    Frente A~ FA                  1
#>  3 AVIAGA              48     0 AVIAGA, Carol    Partido ~ PN                  1
#>  4 BORDABERRY          48     1 BORDABERRY, Ped~ Partido ~ PC                  1
#>  5 GOÑI                48     1 GOÑI ROMERO, Ro~ Partido ~ PN                  2
#>  6 LAZO                48     0 LAZO, Sandra     Frente A~ FA                  3
#>  7 MAHIA               48     1 MAHIA, Jose Car~ Frente A~ FA                  1
#>  8 MERONI              48     1 <NA>             <NA>      <NA>               NA
#>  9 PEREYRA             48     0 PEREYRA, Susana  Frente A~ FA                  1
#> 10 TOURNE              48     0 TOURNE, Daisy    Frente A~ FA                  1
#> 11 VIERA               48     1 VIERA, Tabare    Partido ~ PC                  1
```

#### Notas

-----

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Unidad de Métodos y Acceso a
Datos, Facultad de Ciencias Sociales, Universidad de la República
(UMAD-FCS-UdelaR)
