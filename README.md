
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
[![](https://img.shields.io/badge/devel%20version-0.1.0-orange.svg)](https://github.com/Nicolas-Schmidt/puy)
[![R-CMD-check](https://github.com/Nicolas-Schmidt/puy/workflows/R-CMD-check/badge.svg)](https://github.com/Nicolas-Schmidt/puy/actions)
<!-- badges: end -->

### Descripción

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
#>  5 GOI                 48 COMISION ~ 2019-09-17 35AU~ SEÑOR GOÑI. Pido la~     1
#>  6 LAZO                48 COMISION ~ 2019-09-17 35AU~ SEÑORA LAZO. Voto p~     0
#>  7 MAHIA               48 COMISION ~ 2019-09-17 35AU~ SEÑOR MAHIA. Pido l~     1
#>  8 MERONI              48 COMISION ~ 2019-09-17 35AU~ SEÑOR MERONI. Voto,~     1
#>  9 PEREYRA             48 COMISION ~ 2019-09-17 35AU~ SEÑORA PEREYRA. Con~     0
#> 10 TOURNE              48 COMISION ~ 2019-09-17 35AU~ SEÑORA TOURNE. Voy ~     0
#> 11 VIERA               48 COMISION ~ 2019-09-17 35AU~ SEÑOR VIERA. Voto p~     1


text <- speech::speech_legis_replace(tidy_speech = text, old = "GOI", new = "GONI")
text
#> # A tibble: 11 x 7
#>    legislator legislature chamber    date       id    speech                 sex
#>    <chr>            <dbl> <chr>      <date>     <chr> <chr>                <dbl>
#>  1 ABDALA              48 COMISION ~ 2019-09-17 35AU~ SEÑOR ABDALA. Voto ~     1
#>  2 ASTI                48 COMISION ~ 2019-09-17 35AU~ SEÑOR ASTI. Obviame~     1
#>  3 AVIAGA              48 COMISION ~ 2019-09-17 35AU~ SEÑORA AVIAGA. Pido~     0
#>  4 BORDABERRY          48 COMISION ~ 2019-09-17 35AU~ SEÑOR BORDABERRY. P~     1
#>  5 GONI                48 COMISION ~ 2019-09-17 35AU~ SEÑOR GOÑI. Pido la~     1
#>  6 LAZO                48 COMISION ~ 2019-09-17 35AU~ SEÑORA LAZO. Voto p~     0
#>  7 MAHIA               48 COMISION ~ 2019-09-17 35AU~ SEÑOR MAHIA. Pido l~     1
#>  8 MERONI              48 COMISION ~ 2019-09-17 35AU~ SEÑOR MERONI. Voto,~     1
#>  9 PEREYRA             48 COMISION ~ 2019-09-17 35AU~ SEÑORA PEREYRA. Con~     0
#> 10 TOURNE              48 COMISION ~ 2019-09-17 35AU~ SEÑORA TOURNE. Voy ~     0
#> 11 VIERA               48 COMISION ~ 2019-09-17 35AU~ SEÑOR VIERA. Voto p~     1

floor_speech <- as_speech_politicos(speech = text)
floor_speech
#> # A tibble: 11 x 11
#>    legislator legislature chamber  date       id     speech      sex legislator2
#>    <chr>            <dbl> <chr>    <date>     <chr>  <chr>     <dbl> <chr>      
#>  1 ASTI                48 COMISIO~ 2019-09-17 35AUV~ SEÑOR AS~     1 ASTI, Alfr~
#>  2 GONI                48 COMISIO~ 2019-09-17 35AUV~ SEÑOR GO~     1 GONI ROMER~
#>  3 LAZO                48 COMISIO~ 2019-09-17 35AUV~ SEÑORA L~     0 LAZO, Sand~
#>  4 MAHIA               48 COMISIO~ 2019-09-17 35AUV~ SEÑOR MA~     1 MAHIA, Jos~
#>  5 PEREYRA             48 COMISIO~ 2019-09-17 35AUV~ SEÑORA P~     0 PEREYRA, S~
#>  6 TOURNE              48 COMISIO~ 2019-09-17 35AUV~ SEÑORA T~     0 TOURNE, Da~
#>  7 BORDABERRY          48 COMISIO~ 2019-09-17 35AUV~ SEÑOR BO~     1 BORDABERRY~
#>  8 VIERA               48 COMISIO~ 2019-09-17 35AUV~ SEÑOR VI~     1 VIERA, Tab~
#>  9 ABDALA              48 COMISIO~ 2019-09-17 35AUV~ SEÑOR AB~     1 ABDALA, Pa~
#> 10 AVIAGA              48 COMISIO~ 2019-09-17 35AUV~ SEÑORA A~     0 AVIAGA, Ca~
#> 11 MERONI              48 COMISIO~ 2019-09-17 35AUV~ SEÑOR ME~     1 <NA>       
#> # ... with 3 more variables: party <chr>, party_acron <chr>, indicator <int>


str(floor_speech)
#> tibble[,11] [11 x 11] (S3: tbl_df/tbl/data.frame)
#>  $ legislator : chr [1:11] "ASTI" "GONI" "LAZO" "MAHIA" ...
#>  $ legislature: num [1:11] 48 48 48 48 48 48 48 48 48 48 ...
#>  $ chamber    : chr [1:11] "COMISION PERMANENTE" "COMISION PERMANENTE" "COMISION PERMANENTE" "COMISION PERMANENTE" ...
#>  $ date       : Date[1:11], format: "2019-09-17" "2019-09-17" ...
#>  $ id         : chr [1:11] "35AUVF4" "35AUVF4" "35AUVF4" "35AUVF4" ...
#>  $ speech     : chr [1:11] "SEÑOR ASTI. Obviamente, es con mucho gusto y con mucha convicción que vamos a votar a nuestra querida y experim"| __truncated__ "SEÑOR GOÑI. Pido la palabra. SEÑOR GOÑI. El Frente Amplio no podía haber elegido mejor, y agradezco esa elecció"| __truncated__ "SEÑORA LAZO. Voto por la compañera legisladora Daisy Tourné, y quiero fundamentar el voto. Me sumo al agradecim"| __truncated__ "SEÑOR MAHIA. Pido la palabra. SEÑOR MAHIA. Gracias, señor secretario. Simplemente quiero agradecer la gentileza"| __truncated__ ...
#>  $ sex        : num [1:11] 1 1 0 1 0 0 1 1 1 0 ...
#>  $ legislator2: chr [1:11] "ASTI, Alfredo" "GONI ROMERO, Rodrigo" "LAZO, Sandra" "MAHIA, Jose Carlos" ...
#>  $ party      : chr [1:11] "Frente Amplio" "Frente Amplio" "Frente Amplio" "Frente Amplio" ...
#>  $ party_acron: chr [1:11] "FA" "FA" "FA" "FA" ...
#>  $ indicator  : int [1:11] 1 2 3 1 1 1 1 1 1 1 ...

floor_speech[c(1,2,7:11)]
#> # A tibble: 11 x 7
#>    legislator legislature   sex legislator2      party     party_acron indicator
#>    <chr>            <dbl> <dbl> <chr>            <chr>     <chr>           <int>
#>  1 ASTI                48     1 ASTI, Alfredo    Frente A~ FA                  1
#>  2 GONI                48     1 GONI ROMERO, Ro~ Frente A~ FA                  2
#>  3 LAZO                48     0 LAZO, Sandra     Frente A~ FA                  3
#>  4 MAHIA               48     1 MAHIA, Jose Car~ Frente A~ FA                  1
#>  5 PEREYRA             48     0 PEREYRA, Susana  Frente A~ FA                  1
#>  6 TOURNE              48     0 TOURNE, Daisy    Frente A~ FA                  1
#>  7 BORDABERRY          48     1 BORDABERRY, Ped~ Partido ~ PC                  1
#>  8 VIERA               48     1 VIERA, Tabare    Partido ~ PC                  1
#>  9 ABDALA              48     1 ABDALA, Pablo    Partido ~ PN                  1
#> 10 AVIAGA              48     0 AVIAGA, Carol    Partido ~ PN                  1
#> 11 MERONI              48     1 <NA>             <NA>      <NA>               NA
```

#### Notas

-----

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Unidad de Métodos y Acceso a
Datos, Facultad de Ciencias Sociales, Universidad de la República
(UMAD-FCS-UdelaR)
