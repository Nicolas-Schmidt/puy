
<!-- README.md is generated from README.Rmd. Please edit that file -->

## puy: políticos uruguayos

*Nicolás Schmidt, Antonio Cardarello, Alfonso Castiglia, Fabricio
Carneiro,
UMAD<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup>.*

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

### Descripción

Este paquete de R contiene varios conjuntos de datos relativos a
carreras políticas en Uruguay. La base de datos principal contiene la
totalidad de los cargos que fueron ocupados en el parlamento nacional
(Cámara de Diputados y Cámara de Senadores) de 1830 a 2005.
Adicionalmente, y para el mismo periodo están los nombres de los
políticos que ocuparon alguna cartera ministerial.

##### Responsables

| Responsable | Datos                   | Periodo     | Avance                            | Pendiente              | Status           |
| ----------- | ----------------------- | ----------- | --------------------------------- | ---------------------- | ---------------- |
| Schmidt     | Poder Legislativo       | 1830 - 2020 | 1830 - 2005: :heavy\_check\_mark: | 2006 - 2020: :warning: | 92% :arrow\_up:  |
| Cardarello  | Ejecutivo departamental | 1830 - 2020 | 1830 - 2020: :x:                  | 1830 - 2020: :warning: | 0% :arrow\_down: |
| Castiglia   | Gabinetes Ministeriales | 1830 - 2020 | 1830 - 2020: :x:                  | 1830 - 2020: :warning: | 0% :arrow\_down: |
| Carneiro    | Directores OPP          | 196..- 2020 | 1830 - 2020: :x:                  | 1830 - 2020: :warning: | 0% :arrow\_down: |
| Carneiro    | Presidencia y Vice      | 1830 - 2020 | 1830 - 2020: :x:                  | 1830 - 2020: :warning: | 0% :arrow\_down: |
| Carneiro    | BROU                    | 1896 - 2020 | 1896 - 2020: :x:                  | 1896 - 2020: :warning: | 0% :arrow\_down: |
| Carneiro    | Banco Central           | 1967 - 2020 | 1967 - 2020: :x:                  | 1967 - 2020: :warning: | 0% :arrow\_down: |
| \-          | Entes publicos          | \-          | \-                                | \-                     | \-               |

**Juntas Militares?** Para hacer la trayectoria de civiles que iniciaron
en politica y se volveron gorilas… Alberto Demicheli recuerdo es el
facho, estuvo con Terra y luego en el 70 y algo

En carpeta `data-raw/viejo_banco` estan las bases que estaban en banco
de datos:

  - Autoridades Economicas (opp, brou, bc)
  - Consejo de Estado 1973-1985
  - Gabinetes 1943-2014
  - Presidentes Uruguayos
  - Entes publicos 1985-2014

##### Estructura de los datos (Instrucciones)

  - `nombre`
  - `cargo`
  - `condicion`
  - `legislatura`
  - `partrido`
  - `fraccion`
  - `fecha_inicio`
  - `fecha_fin`
  - `departamento`
  - `observaciones`

### Instalación

``` r
## Versión en desarrollo
source("https://install-github.me/Nicolas-Schmidt/puy")
```

### Ejemplo

    #> -- Attaching packages --------------------------------------------------------------------------- tidyverse 1.3.0 --
    #> v ggplot2 3.3.2     v purrr   0.3.4
    #> v tibble  3.0.1     v dplyr   0.8.5
    #> v tidyr   1.1.0     v stringr 1.4.0
    #> v readr   1.3.1     v forcats 0.5.0
    #> -- Conflicts ------------------------------------------------------------------------------ tidyverse_conflicts() --
    #> x dplyr::filter() masks stats::filter()
    #> x dplyr::lag()    masks stats::lag()

``` r
vars <- c("legislador2", "camara", "condicion", "departamento", 
          "fecha_inicio", "fecha_fin", "partido", "legislatura")

str(politicos[, vars], 15)
#> 'data.frame':    6771 obs. of  8 variables:
#>  $ legislador2 : chr  "ABADIE SANTOS, Horacio" "ABADIE SANTOS, Horacio" "ABDALA, Washington" "ABDALA, Washington" ...
#>  $ camara      : chr  "Diputados" "Diputados" "Diputados" "Diputados" ...
#>  $ condicion   : chr  "Titular" "Titular" "Titular" "Titular" ...
#>  $ departamento: chr  "Montevideo" "Tacuarembo" "Montevideo" "Montevideo" ...
#>  $ fecha_inicio: chr  "18 de mayo de 1934" "2 de julio de 1934" "15 de febrero de 1995" "15 de febrero de 2000" ...
#>  $ fecha_fin   : chr  "1 de julio de 1934" "24 de noviembre de 1936" "14 de febrero de 2000" "14 de febrero de 2005" ...
#>  $ partido     : chr  "Partido Colorado" "Partido Colorado" "Partido Colorado" "Partido Colorado" ...
#>  $ legislatura : num  32 32 44 45 46 30 29 30 20 23 ...



## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## legislador más prolifico
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

politicos2 <-
    politicos %>% 
    select(legislador2, legislatura, partido, camara) %>% 
    filter(partido != "") %>% 
    distinct() %>% 
    na.omit() %>% 
    split(.$legislador2)
    

unique(politicos2[[which.max(lapply(politicos2, nrow))]]$legislador2)
#> [1] "ESPALTER, Jose"

legis <- unique(politicos2[[which.max(lapply(politicos2, nrow))]]$legislatura)
cat("\nLegislaturas:\n", " numero  : ", legis, "\n", " cantidad: ", length(legis))
#> 
#> Legislaturas:
#>   numero  :  19 20 21 22 23 24 25 26 27 28 29 30 32 33 
#>   cantidad:  14

unique(politicos2[[which.max(lapply(politicos2, nrow))]]$partido)
#> [1] "Partido Colorado"         "Partido Colorado Radical"
```

#### Notas

-----

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Unidad de Métodos y Acceso a
Datos, Facultad de Ciencias Sociales, Universidad de la República
(UMAD-FCS-UdelaR)
