## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## BASE MINISTROS
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


ministros <- rio::import("data-raw/bases_raw/Base_Ministros.xls")
names(ministros)[which(names(ministros) == "nombre_ministro")] <- "politico"
ministros[which(ministros$ministerio == "Industria, Trabajo e Instrucción Púb."), "ministerio"]   <- "Industria, Trabajo e Instrucción Pública"
ministros[which(ministros$ministerio == "Vivienda, Ordenamiento Territorial y MA"), "ministerio"] <- "Vivienda, Ordenamiento Territorial y Medio Ambiente"






