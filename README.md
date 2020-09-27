
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

    #> -- Attaching packages ---------------------------------------------------------------------------------------- tidyverse 1.3.0 --
    #> v ggplot2 3.3.2     v purrr   0.3.4
    #> v tibble  3.0.1     v dplyr   0.8.5
    #> v tidyr   1.1.0     v stringr 1.4.0
    #> v readr   1.3.1     v forcats 0.5.0
    #> -- Conflicts ------------------------------------------------------------------------------------------- tidyverse_conflicts() --
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
    
set <- politicos2[[which.max(lapply(politicos2, nrow))]]
rownames(set) <- NULL

legis <- unique(set$legislatura)
cat("\nLegislaturas:\n", " numero  : ", legis, "\n", " cantidad: ", length(legis))
#> 
#> Legislaturas:
#>   numero  :  19 20 21 22 23 24 25 26 27 28 29 30 32 33 
#>   cantidad:  14


set
#>       legislador2 legislatura                  partido    camara
#> 1  ESPALTER, Jose          19         Partido Colorado Diputados
#> 2  ESPALTER, Jose          20         Partido Colorado Diputados
#> 3  ESPALTER, Jose          21         Partido Colorado Diputados
#> 4  ESPALTER, Jose          21         Partido Colorado    Senado
#> 5  ESPALTER, Jose          22         Partido Colorado    Senado
#> 6  ESPALTER, Jose          23         Partido Colorado    Senado
#> 7  ESPALTER, Jose          24         Partido Colorado    Senado
#> 8  ESPALTER, Jose          25         Partido Colorado    Senado
#> 9  ESPALTER, Jose          26         Partido Colorado Diputados
#> 10 ESPALTER, Jose          26         Partido Colorado    Senado
#> 11 ESPALTER, Jose          27         Partido Colorado    Senado
#> 12 ESPALTER, Jose          28         Partido Colorado    Senado
#> 13 ESPALTER, Jose          29 Partido Colorado Radical Diputados
#> 14 ESPALTER, Jose          30 Partido Colorado Radical Diputados
#> 15 ESPALTER, Jose          32         Partido Colorado    Senado
#> 16 ESPALTER, Jose          33         Partido Colorado    Senado


## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## legislador más party-volat
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~


set2 <-  do.call(rbind, politicos2[lengths(lapply(politicos2, function(x){unique(x$partido)})) == 3])
unique(set2$legislador2)
#>  [1] "ALONSO, Nelson"         "ARISMENDI, Rodney"      "BATALLA, Hugo"         
#>  [4] "CARDOSO, Jose Pedro"    "ERRO, Enrique"          "FAU, Yamandu"          
#>  [7] "MIERES, Pablo"          "PRANDO, Carlos Maria"   "PRIETO, Baltasar"      
#> [10] "ROBALLO, Alba"          "RODRIGUEZ, Enrique"     "SANTAMARINA, Eden Melo"


print(tibble::as_tibble(set2), n = Inf)
#> # A tibble: 60 x 4
#>    legislador2            legislatura partido                           camara  
#>    <chr>                        <dbl> <chr>                             <chr>   
#>  1 ALONSO, Nelson                  40 Partido Colorado                  Diputad~
#>  2 ALONSO, Nelson                  42 Partido Frente Amplio             Diputad~
#>  3 ALONSO, Nelson                  42 Partido Frente Amplio             Senado  
#>  4 ALONSO, Nelson                  43 Partido por el Gobierno del Pueb~ Senado  
#>  5 ARISMENDI, Rodney               34 Partido Comunista del Uruguay     Diputad~
#>  6 ARISMENDI, Rodney               35 Partido Comunista del Uruguay     Diputad~
#>  7 ARISMENDI, Rodney               36 Partido Comunista del Uruguay     Diputad~
#>  8 ARISMENDI, Rodney               37 Partido Comunista del Uruguay     Diputad~
#>  9 ARISMENDI, Rodney               38 Partido Comunista del Uruguay     Diputad~
#> 10 ARISMENDI, Rodney               39 Frente Izquierda de Liberacion    Diputad~
#> 11 ARISMENDI, Rodney               40 Frente Izquierda de Liberacion    Diputad~
#> 12 ARISMENDI, Rodney               41 Partido Frente Amplio             Diputad~
#> 13 BATALLA, Hugo                   38 Partido Colorado                  Diputad~
#> 14 BATALLA, Hugo                   39 Partido Colorado                  Diputad~
#> 15 BATALLA, Hugo                   40 Partido Colorado                  Diputad~
#> 16 BATALLA, Hugo                   41 Partido Democrata Cristiano       Diputad~
#> 17 BATALLA, Hugo                   42 Partido Democrata Cristiano       Senado  
#> 18 BATALLA, Hugo                   43 Partido Por el Gobierno del Pueb~ Senado  
#> 19 BATALLA, Hugo                   44 Partido Colorado                  Senado  
#> 20 CARDOSO, Jose Pedro             33 Partido Socialista                Diputad~
#> 21 CARDOSO, Jose Pedro             34 Partido Socialista                Diputad~
#> 22 CARDOSO, Jose Pedro             35 Partido Socialista                Diputad~
#> 23 CARDOSO, Jose Pedro             36 Partido Socialista                Diputad~
#> 24 CARDOSO, Jose Pedro             37 Partido Socialista del Uruguay    Senado  
#> 25 CARDOSO, Jose Pedro             38 Partido Socialista del Uruguay    Senado  
#> 26 CARDOSO, Jose Pedro             42 Partido Frente Amplio             Senado  
#> 27 ERRO, Enrique                   36 Partido Nacional                  Diputad~
#> 28 ERRO, Enrique                   37 Partido Nacional                  Diputad~
#> 29 ERRO, Enrique                   38 Partido Nacional                  Diputad~
#> 30 ERRO, Enrique                   39 Partido Union Popular             Diputad~
#> 31 ERRO, Enrique                   41 Partido Frente Amplio             Senado  
#> 32 FAU, Yamandu                    42 Partido Frente Amplio             Diputad~
#> 33 FAU, Yamandu                    42 Partido Frente Amplio             Senado  
#> 34 FAU, Yamandu                    43 Partido por el Gobierno del Pueb~ Diputad~
#> 35 FAU, Yamandu                    44 Partido Colorado                  Diputad~
#> 36 FAU, Yamandu                    45 Partido Colorado                  Senado  
#> 37 MIERES, Pablo                   42 Partido Frente Amplio             Diputad~
#> 38 MIERES, Pablo                   43 Partido Por el Gobierno del Pueb~ Diputad~
#> 39 MIERES, Pablo                   45 Partido Nuevo Espacio             Diputad~
#> 40 PRANDO, Carlos Maria            24 Partido Colorado                  Diputad~
#> 41 PRANDO, Carlos Maria            28 Partido Colorado                  Diputad~
#> 42 PRANDO, Carlos Maria            29 Partido Colorado General Rivera   Diputad~
#> 43 PRANDO, Carlos Maria            30 Partido Colorado General Rivera   Diputad~
#> 44 PRANDO, Carlos Maria            31 Partido por la Tradicion Colorad~ Diputad~
#> 45 PRIETO, Baltasar                42 Partido Frente Amplio             Diputad~
#> 46 PRIETO, Baltasar                43 Partido Por el Gobierno del Pueb~ Diputad~
#> 47 PRIETO, Baltasar                44 Partido Colorado                  Diputad~
#> 48 ROBALLO, Alba                   38 Partido Colorado                  Senado  
#> 49 ROBALLO, Alba                   39 Partido Colorado                  Senado  
#> 50 ROBALLO, Alba                   40 Partido Colorado                  Senado  
#> 51 ROBALLO, Alba                   41 Partido Democrata Cristiano       Senado  
#> 52 ROBALLO, Alba                   43 Partido Frente Amplio             Senado  
#> 53 RODRIGUEZ, Enrique              35 Partido Comunista del Uruguay     Diputad~
#> 54 RODRIGUEZ, Enrique              38 Partido Comunista del Uruguay     Diputad~
#> 55 RODRIGUEZ, Enrique              39 Frente Izquierda de Liberacion    Senado  
#> 56 RODRIGUEZ, Enrique              40 Frente Izquierda de Liberacion    Senado  
#> 57 RODRIGUEZ, Enrique              41 Partido Frente Amplio             Senado  
#> 58 SANTAMARINA, Eden Melo          42 Partido Frente Amplio             Diputad~
#> 59 SANTAMARINA, Eden Melo          43 Partido Por el Gobierno del Pueb~ Diputad~
#> 60 SANTAMARINA, Eden Melo          44 Partido Colorado                  Diputad~

# global
table(sapply(politicos2, function(x){length(unique(x$partido))}))
#> 
#>    1    2    3 
#> 2576   55   12
```

#### Notas

-----

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Unidad de Métodos y Acceso a
Datos, Facultad de Ciencias Sociales, Universidad de la República
(UMAD-FCS-UdelaR)
