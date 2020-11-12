
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## concejales y alcaldes!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

concejales <- rio::import("data-raw/bases_limpias/alcaldes_concejales.xlsx")

## "politico"     ---> con tilde
## "politico_st"  ---> sin tilde
## "cargo"
## "condicion"
## "departamento"
## "Municipio"
## "fecha_inicio"
## "fecha_fin"
## "partido"
## "fraccion"


# partido y fraccion - hoja
concejales          <- tidyr::separate(concejales, 'partido', into = c("partido", "fraccion"), sep = "-")
concejales$partido  <- stringr::str_squish(concejales$partido)
concejales$fraccion <- stringr::str_squish(concejales$fraccion)

concejales[concejales$partido %in% c("PFA", "FA"), "partido"] <- "Partido Frente Amplio"
concejales[concejales$partido == "PN" , "partido"] <- "Partido Nacional"
concejales[concejales$partido == "PC" , "partido"] <- "Partido Colorado"
concejales[concejales$partido == "P. de la CONC.", "partido"] <- "Partido de la Concertacion"

# nombre
nombres_ac <- function(x){
    xn <- stringr::str_extract(x, "[A-z]+([A-Z ]+\\. |\\s)")
    xl <- nchar(xn)
    xa <- substring(text = x, first = xl, last = nchar(x))
    return(stringr::str_squish(paste(xa, xn, sep = ", ")))
}

concejales$nombre <- nombres_ac(concejales$politico_st)

# check
