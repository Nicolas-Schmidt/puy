
l[l$departamento == "alto"            , "departamento"] <- "Salto"
l[l$departamento == "ontevideo"       , "departamento"] <- "Montevideo"
l[l$departamento == "an JosÃ©"        , "departamento"] <- "San Jose"
l[l$departamento == "aldonado"        , "departamento"] <- "Maldonado"
l[l$departamento == "San JosÃ©"       , "departamento"] <- "San Jose"
l[l$departamento == "oriano"          , "departamento"] <- "Soriano"
l[l$departamento == "inas"            , "departamento"] <- "Lavalleja"
l[l$departamento == "olonia"          , "departamento"] <- "Colonia"
l[l$departamento == "urazno"          , "departamento"] <- "Durazno"
l[l$departamento == "PaysandÃº"       , "departamento"] <- "Paysandu"
l[l$departamento == "rro Largo"       , "departamento"] <- "Cerro Largo"
l[l$departamento == " Canelones"      , "departamento"] <- "Canelones"
l[l$departamento == "Salto "          , "departamento"] <- "Salto"
l[l$departamento == "lto"             , "departamento"] <- "Salto"
l[l$departamento == " Soriano"        , "departamento"] <- "Soriano"
l[l$departamento == "ntevideo"        , "departamento"] <- "Montevideo"
l[l$departamento == "aysandÃº"        , "departamento"] <- "Paysandu"
l[l$departamento == "Tacuarembo "     , "departamento"] <- "Tacuarembo"
l[l$departamento == "acuarembo"       , "departamento"] <- "Tacuarembo"
l[l$departamento == "anelones"        , "departamento"] <- "Canelones"
l[l$departamento == "erro Largo"      , "departamento"] <- "Cerro Largo"
l[l$departamento == " PaysandÃº"      , "departamento"] <- "Paysandu"
l[l$departamento == " Montevideo"     , "departamento"] <- "Montevideo"
l[l$departamento == " Salto"          , "departamento"] <- "Salto"
l[l$departamento == "San JosÃ© "      , "departamento"] <- "San Jose"
l[l$departamento == "Florida "        , "departamento"] <- "Florida"
l[l$departamento == "lorida"          , "departamento"] <- "Florida"
l[l$departamento == " Flores"         , "departamento"] <- "Flores"
l[l$departamento == "razno"           , "departamento"] <- "Durazno"
l[l$departamento == "Cerro  Largo"    , "departamento"] <- "Cerro Largo"
l[l$departamento == "PaysandÃº "      , "departamento"] <- "Paysandu"
l[l$departamento == " Treinta y Tres" , "departamento"] <- "Treinta y Tres"
l[l$departamento == "Flores "         , "departamento"] <- "Flores"
l[l$departamento == "Montevideo "     , "departamento"] <- "Montevideo"
l[l$departamento == "Soriano "        , "departamento"] <- "Soriano"
l[grep(x = l$departamento, pattern = "Negro$"), "departamento"] <- "Rio Negro"
l[grep(x = l$departamento, pattern = "Negro $"), "departamento"] <- "Rio Negro"
l[l$departamento == "Minas"           , "departamento"] <- "Lavalleja"


departamentos <- c("Montevideo", "Canelones", "Soriano", "Rio Negro", "Flores",
                  "Florida", "Rocha", "Rivera", "Salto", "Maldonado",
                  "Paysandu", "Tacuarembo", "San Jose", "Lavalleja",
                  "Cerro Largo", "Durazno", "Artigas", "Treinta y Tres", "Colonia")
# check
unique(l[!(l$departamento %in% departamentos), "departamento"])
# replace NA
l[!(l$departamento %in% departamentos), "departamento"] <- NA


## --------------------- CONDICION
l[!(l$condicion %in% c("Suplente", "Titular")), "condicion"] <- NA

## --------------------- CAMARA
l[!(l$camara %in% c("Senado", "Diputados")), "camara"] <- NA

## --------------------- CAMARA
unique(l$legislatura)
l$legislatura <- stringr::str_squish(l$legislatura)
l[l$legislatura == "(*", "legislatura"] <- "___"
l[l$legislatura == "(1", "legislatura"] <- "___"
l[which(l$legislatura %in% c("S",  "D", "Am")), 'legislatura'] <- "___"
l[l$legislatura == "___", "legislatura"] <- NA
l$legislatura <- as.numeric(l$legislatura)














