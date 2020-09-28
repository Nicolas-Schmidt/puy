
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

<details>

<summary><b><a style="cursor: pointer;">Click here to expand </a></b>
</summary>

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
#>  [4] "ERRO, Enrique"          "FAU, Yamandu"           "MIERES, Pablo"         
#>  [7] "PRANDO, Carlos Maria"   "PRIETO, Baltasar"       "ROBALLO, Alba"         
#> [10] "RODRIGUEZ, Enrique"     "SANTAMARINA, Eden Melo"


print(set2 %>% select(-legislatura, -camara) %>% distinct())
#>               legislador2                            partido
#> 1          ALONSO, Nelson                   Partido Colorado
#> 2          ALONSO, Nelson              Partido Frente Amplio
#> 3          ALONSO, Nelson Partido por el Gobierno del Pueblo
#> 4       ARISMENDI, Rodney      Partido Comunista del Uruguay
#> 5       ARISMENDI, Rodney     Frente Izquierda de Liberacion
#> 6       ARISMENDI, Rodney              Partido Frente Amplio
#> 7           BATALLA, Hugo                   Partido Colorado
#> 8           BATALLA, Hugo        Partido Democrata Cristiano
#> 9           BATALLA, Hugo Partido Por el Gobierno del Pueblo
#> 10          ERRO, Enrique                   Partido Nacional
#> 11          ERRO, Enrique              Partido Union Popular
#> 12          ERRO, Enrique              Partido Frente Amplio
#> 13           FAU, Yamandu              Partido Frente Amplio
#> 14           FAU, Yamandu Partido por el Gobierno del Pueblo
#> 15           FAU, Yamandu                   Partido Colorado
#> 16          MIERES, Pablo              Partido Frente Amplio
#> 17          MIERES, Pablo Partido Por el Gobierno del Pueblo
#> 18          MIERES, Pablo              Partido Nuevo Espacio
#> 19   PRANDO, Carlos Maria                   Partido Colorado
#> 20   PRANDO, Carlos Maria    Partido Colorado General Rivera
#> 21   PRANDO, Carlos Maria Partido por la Tradicion Coloradal
#> 22       PRIETO, Baltasar              Partido Frente Amplio
#> 23       PRIETO, Baltasar Partido Por el Gobierno del Pueblo
#> 24       PRIETO, Baltasar                   Partido Colorado
#> 25          ROBALLO, Alba                   Partido Colorado
#> 26          ROBALLO, Alba        Partido Democrata Cristiano
#> 27          ROBALLO, Alba              Partido Frente Amplio
#> 28     RODRIGUEZ, Enrique      Partido Comunista del Uruguay
#> 29     RODRIGUEZ, Enrique     Frente Izquierda de Liberacion
#> 30     RODRIGUEZ, Enrique              Partido Frente Amplio
#> 31 SANTAMARINA, Eden Melo              Partido Frente Amplio
#> 32 SANTAMARINA, Eden Melo Partido Por el Gobierno del Pueblo
#> 33 SANTAMARINA, Eden Melo                   Partido Colorado

# global
table(sapply(politicos2, function(x){length(unique(x$partido))}))
#> 
#>    1    2    3 
#> 2576   56   11
```

</details>

<p>

</p>

#### Notas

-----

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Unidad de Métodos y Acceso a
Datos, Facultad de Ciencias Sociales, Universidad de la República
(UMAD-FCS-UdelaR)
