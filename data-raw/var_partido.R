

l[l$partido == "RepresentÃ³ al Partido Frente Amplio (43 y 44) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio(45)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "Partido por la TradiciÃ³n Colorada", "partido"] <- "Partido por la Tradicion Colorada"
l[l$partido == "RepresentÃ³ al Partido Colorado ____ RepresentÃ³ al Partido Colorado", ] <- "Partido Colorado"
l[l$partido == "Partido DemÃ³crata Cristiano", "partido"] <- "Partido Democrata Cristiano"
l[l$partido == "Partido Nacional (***)", "partido"] <- "Partido Nacional"
#
l[l$partido == "RepresentÃ³  al Partido Colorado (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 40, "partido"] <- "Partido Colorado"
l[l$partido == "RepresentÃ³  al Partido Colorado (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³  al Partido Colorado (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 43, "partido"] <- "Partido por el Gobierno del Pueblo"
#
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Frente Amplio (43 y 44) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Socialista (38) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura == 38, "partido"] <- "Partido Socialista"
l[l$partido == "RepresentÃ³ al Partido Socialista (38) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "Partido DemÃ³crata Cristiano (Frente Amplio) (42)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido Frente Amplio (43)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (34,35,36,37 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura %in% c(34, 35, 36, 37, 38), "partido"] <- "Partido Comunista del Uruguay"
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (34,35,36,37 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura %in% c(39, 40), "partido"] <- "Frente Izquierda de Liberacion"
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (34,35,36,37 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura == 41, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (30 y 31) ____ RepresentÃ³ al Partido Nacional Independiente (34)" & l$legislatura %in% c(30, 31), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (30 y 31) ____ RepresentÃ³ al Partido Nacional Independiente (34)" & l$legislatura == 34, "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "RepresentÃ³ al Partido Por el Gobierno del Pueblo (43) ____ RepresentÃ³ al Partido Nuevo Espacio (44)" & l$legislatura == 43, "partido"] <- "Partido Por el Gobierno del Pueblo"
l[l$partido == "RepresentÃ³ al Partido Por el Gobierno del Pueblo (43) ____ RepresentÃ³ al Partido Nuevo Espacio (44)" & l$legislatura == 44, "partido"] <- "Partido Nuevo Espacio"
#
l[l$partido == "RepresentÃ³ al Partido Frente Amplio (44) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional  (29,30 y 34) ____ RepresentÃ³ al Partido Nacional Independiente (35,36 y 37)"  & l$legislatura %in% c(29, 30, 34), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional  (29,30 y 34) ____ RepresentÃ³ al Partido Nacional Independiente (35,36 y 37)"  & l$legislatura %in% c(35, 36, 37), "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (31 y 38) ____ RepresentÃ³ al Partido Nacional Independiente (34,35 y 36)" & l$legislatura %in% c(31, 38), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (31 y 38) ____ RepresentÃ³ al Partido Nacional Independiente (34,35 y 36)" & l$legislatura %in% c(34, 35, 36), "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "Partido DemÃ³crata Cristiano (Frente Amplio)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "Progresista/Frente Amplio", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Colorado (38,39,40 y 44) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41 y 42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura %in% c(38, 39, 40, 44), "partido"] <- "Partido Colorado"
l[l$partido == "RepresentÃ³ al Partido Colorado (38,39,40 y 44) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41 y 42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura %in% c(41, 42), "partido"] <- "Partido Democrata Cristiano"
l[l$partido == "RepresentÃ³ al Partido Colorado (38,39,40 y 44) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41 y 42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura  == 43, "partido"] <- "Partido Por el Gobierno del Pueblo"
#
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente ( 35 y 36) ____ RepresentÃ³ al Partido Nacional (37,38,39,40 y 41)" & l$legislatura %in% c(35, 36), "partido"] <- "Partido Nacional Independiente"
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente ( 35 y 36) ____ RepresentÃ³ al Partido Nacional (37,38,39,40 y 41)" & l$legislatura %in% c(37, 38, 39, 40, 41), "partido"] <- "Partido Nacional"
#
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (36) ____ RepresentÃ³ al Partido Nacional (39.40 y 41)" & l$legislatura == 36, "partido"] <- "Partido Nacional Independiente"
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (36) ____ RepresentÃ³ al Partido Nacional (39.40 y 41)" & l$legislatura %in% c(39, 40, 41), "partido"] <- "Partido Nacional"
#
l[l$partido == "Partido Colorado ", "partido"] <- "Partido Colorado"
l[l$partido == "Partido Encuentro Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 43, "partido"] <- "Partido Por el Gobierno del Pueblo"
#
l[l$partido == "Partido Colorado                                                                                                 ", "partido"] <- "Partido Colorado"
#
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ Represento al Partido Frente Amplio (43)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano  (Frente Amplio) (41)" & l$legislatura == 40, "partido"] <- "Partido Democrata Cristiano"
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano  (Frente Amplio) (41)" & l$legislatura == 41, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (34 y 35) ____ RepresentÃ³ al Partido Nacional (37 y 39)" & l$legislatura %in% c(34, 35), "partido"] <- "Partido Nacional Independiente"
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (34 y 35) ____ RepresentÃ³ al Partido Nacional (37 y 39)" & l$legislatura %in% c(37, 39), "partido"] <- "Partido Nacional"
#
l[l$partido == "RepresentÃ³ al Partido Comunista (35) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (38 y 40)" & l$legislatura == 35, "partido"] <- "Partido Comunista"
l[l$partido == "RepresentÃ³ al Partido Comunista (35) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (38 y 40)" & l$legislatura %in% c(38, 40), "partido"] <- "Frente Izquierda de Liberacion"
#
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura == 43, "partido"] <- "Partido Por el Gobierno del Pueblo"
#
l[l$partido == "RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41) " & l$legislatura == 40, "partido"] <- "Frente Izquierda de Liberacion"
l[l$partido == "RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41) " & l$legislatura == 41, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "Partido UniÃ³n Popular (*)" & l$legislatura == 41, "partido"] <- "Partido Union Popular"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (26, 27 y 30) ____ RepresentÃ³ al Partido Nacional Independiente (31, 34 y 35)" & l$legislatura %in% c(26, 27, 30), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (26, 27 y 30) ____ RepresentÃ³ al Partido Nacional Independiente (31, 34 y 35)" & l$legislatura %in% c(31, 34, 35), "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (26, 27, 28. 30, 31, 37, 38 y 39) ____ RepresentÃ³ al Partido Nacional Independiente (34, 35 y 36)" & l$legislatura %in% c(26, 27, 28, 30, 31, 37, 38, 39), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (26, 27, 28. 30, 31, 37, 38 y 39) ____ RepresentÃ³ al Partido Nacional Independiente (34, 35 y 36)" & l$legislatura %in% c(34, 35, 36), "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (35 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura %in% c(35, 38), "partido"] <- "Partido Comunista del Uruguay"
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (35 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura %in% c(39, 40), "partido"] <- "Frente Izquierda de Liberacion"
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (35 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura == 41, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Colorado (28,29 y 32 ____ RepresentÃ³ al Partido por la TradiciÃ³n Colorada (31)" & l$legislatura %in% c(28, 29, 32), "partido"] <- "Partido Colorado"
l[l$partido == "RepresentÃ³ al Partido Colorado (28,29 y 32 ____ RepresentÃ³ al Partido por la TradiciÃ³n Colorada (31)" & l$legislatura == 31, "partido"] <- "Partido por la Tradiicion Colorada"
#
l[l$partido == "RepresentÃ³ al Partido Colorado (38, 39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41) ____ RepresentÃ³ al Partido Frente Amplio (43)" & l$legislatura %in% c(38, 39, 40), "partido"] <- "Partido Colorado"
l[l$partido == "RepresentÃ³ al Partido Colorado (38, 39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41) ____ RepresentÃ³ al Partido Frente Amplio (43)" & l$legislatura == 41, "partido"] <- "Partido Democrata Cristiano"
l[l$partido == "RepresentÃ³ al Partido Colorado (38, 39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41) ____ RepresentÃ³ al Partido Frente Amplio (43)" & l$legislatura == 43, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (36, 37, 38, 39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41 y 42) ____ RepresentÃ³ al Frente Amplio (43)" & l$legislatura %in% c(36, 37, 38, 39, 40), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (36, 37, 38, 39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41 y 42) ____ RepresentÃ³ al Frente Amplio (43)" & l$legislatura %in% c(41, 42, 43), "partido"] <- "Partido Frente Amplio"
#
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayo"), "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "Partido Encuentro Progresista/Frente Amplio", "partido"] <- "Partido Frente Amplio"
#
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(43\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
#
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(44\\) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(44\\) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al  Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(43 y 44\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio 45\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido DemÃ³crata Cristiano \\(Frente Amplio\\) \\(41\\) ____ RepresentÃ³ al Partido Frente Amplio \\(44\\) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al  Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(43 y 44\\) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al  Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al  Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "Partido Nacional ", "partido"] <- "Partido Nacional"
l[l$partido == "Partido Nacional  " , "partido"] <- "Partido Nacional"
l[grep(x = l$partido, pattern = "^Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[l$partido == "Partido Frente Izquierda de LiberaciÃ³n", "partido"] <- "Partido Frente Izquierda de Liberacion"
#
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (35,36 y 37) ____ RepresentÃ³ al Partido Nacional (38)" & l$legislatura %in% c(35, 36, 37), "partido"] <- "Partido Nacional Independiente"
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (35,36 y 37) ____ RepresentÃ³ al Partido Nacional (38)" & l$legislatura %in% c(38), "partido"] <- "Partido Nacional"
#
l[grep(x = l$partido, pattern = "^Partido UniÃ³n C"), "partido"]   <- "Partido Union Civica del Uruguay"
l[grep(x = l$partido, pattern = "vica del Uruguay $"), "partido" ] <- "Partido Union Civica del Uruguay"
l[grep(x = l$partido, pattern = "vica del Uruguay$"), "partido" ]  <- "Partido Union Civica del Uruguay"
l[l$partido == "RepresentÃ³ al Partido Frente Amplio (Legislatura 44) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio (Legislatura 45)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "Represento al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
l[l$partido == "Represento al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 43, "partido"] <- "Partido por el Gobierno del Pueblo"
l[l$partido == "Partido DemÃ³crata Cristiano (Frente Amplio) (41 y 43)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido Frente Amplio (44) ____ Represento al Encuentro Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(44\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ a la UniÃ³n C"), "partido"] <- "Partido Union Civica del Uruguay"
l[l$partido == "RepresentÃ³ al Partido Frente Amplio (44) ____ Represento al Encuentro Progresista/Frente Amplio (45)" , "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (Legislaturas 26,27 y 28) ____ RepresentÃ³ al Partido Radicalismo Blanco (Legislaturas 29 y 30)" & l$legislatura %in% c(26, 27, 28), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (Legislaturas 26,27 y 28) ____ RepresentÃ³ al Partido Radicalismo Blanco (Legislaturas 29 y 30)" & l$legislatura %in% c(29, 30), "partido"] <- "Partido Radicalismo Blanco"
#
l[l$partido == "RepresentÃ³ al Partido Socialista (33,34,35 y 36) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura %in% c(33, 34, 35, 36), "partido"] <- "Partido Socialista"
l[l$partido == "RepresentÃ³ al Partido Socialista (33,34,35 y 36) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (36) ____ RepresentÃ³ al Partido Nacional (39.40 y 41)" & l$legislatura == 36, "partido"] <- "Partido Nacional Independiente"
l[l$partido == "RepresentÃ³ al Partido Nacional Independiente (36) ____ RepresentÃ³ al Partido Nacional (39.40 y 41)" & l$legislatura %in% c(39, 40, 41), "partido"] <- "Partido Nacional"
#
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido Colorado ____ RepresentÃ³ al Partido Colorado" , "partido"] <- "Partido Colorado"
l[l$partido == "Partido DemÃ³crata Cristiano" , "partido"] <- "Partido Democrata Cristiano"
#
l[l$partido == "RepresentÃ³  al Partido Colorado (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 40, "partido"] <- "Partido Colorado"
l[l$partido == "RepresentÃ³  al Partido Colorado (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³  al Partido Colorado (40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido por el Gobierno del Pueblo (43)" & l$legislatura == 43, "partido"] <- "Partido por el Gobierno del Pueblo"
#
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Frente Amplio (43 y 44) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "Partido DemÃ³crata Cristiano (Frente Amplio) (42)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido Frente Amplio (44) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio (45)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "Partido DemÃ³crata Cristiano (Frente Amplio)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido Frente Amplio (43)", "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Socialista (38) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura == 38, "partido"] <- "Partido Socialista"
l[l$partido == "RepresentÃ³ al Partido Socialista (38) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
#
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(43\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(44\\) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio (45) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio (44) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al  Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(43 y 44\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio 45\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido DemÃ³crata Cristiano \\(Frente Amplio\\) \\(41\\) ____ RepresentÃ³ al Partido Frente Amplio \\(44\\) ____ RepresentÃ³ al Partido Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al  Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional  (29,30 y 34) ____ RepresentÃ³ al Partido Nacional Independiente (35,36 y 37)" & l$legislatura %in% c(29, 30, 34), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional  (29,30 y 34) ____ RepresentÃ³ al Partido Nacional Independiente (35,36 y 37)" & l$legislatura %in% c(35, 36, 37), "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (34,35,36,37 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura %in% c(34, 35, 36, 37, 38), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (34,35,36,37 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura %in% c(39, 40), "partido"] <- "Frente Izquierda de Liberacion"
l[l$partido == "RepresentÃ³ al Partido Comunista del Uruguay (34,35,36,37 y 38) ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (41)" & l$legislatura == 41, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (30 y 31) ____ RepresentÃ³ al Partido Nacional Independiente (34)" & l$legislatura %in% c(30, 31), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (30 y 31) ____ RepresentÃ³ al Partido Nacional Independiente (34)" & l$legislatura  == 34, "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "RepresentÃ³ al Partido Por el Gobierno del Pueblo (43) ____ RepresentÃ³ al Partido Nuevo Espacio (44)" & l$legislatura == 43, "partido"] <- "Partido Por el Gobierno del Pueblo"
l[l$partido == "RepresentÃ³ al Partido Por el Gobierno del Pueblo (43) ____ RepresentÃ³ al Partido Nuevo Espacio (44)" & l$legislatura == 44, "partido"] <- "Partido Nuevo Espacio"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (31 y 38) ____ RepresentÃ³ al Partido Nacional Independiente (34,35 y 36)" & l$legislatura %in% c(31, 38), "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (31 y 38) ____ RepresentÃ³ al Partido Nacional Independiente (34,35 y 36)" & l$legislatura %in% c(34, 35, 36), "partido"] <- "Partido Nacional Independiente"
#
l[l$partido == "Partido Colorado General Rivera ", "partido"] <- "Partido Colorado General Rivera"
l[l$partido == "Represento al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido Frente Amplio (43)", "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) ( 41 y 42) ____ RepresentÃ³ al Partido Frente Amplio ( 43)", "partido"] <- "Partido Frente Amplio"
l[grep(x = l$partido, pattern = "^RepresentÃ³ al Partido Frente Amplio \\(43 y 44\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio \\(45\\) ____ RepresentÃ³ al Encuentro Progresista/Frente Amplio/Nueva Mayor"), "partido"] <- "Partido Frente Amplio"
l[l$partido == "Progresista/Frente Amplio ", "partido"] <- "Partido Frente Amplio"
l[l$partido == "RepresentÃ³ al Frente Izquierda de LiberaciÃ³n", "partido"] <- "Frente Izquierda de Liberacion"
#
l[l$partido == "RepresentÃ³ al Partido Colorado ( 27 y 28) ____ RepresentÃ³ al Partido Colorado General Rivera ( 29 y 30)" & l$legislatura %in% c(27, 28), "partido"] <- "Partido Colorado"
l[l$partido == "RepresentÃ³ al Partido Colorado ( 27 y 28) ____ RepresentÃ³ al Partido Colorado General Rivera ( 29 y 30)" & l$legislatura %in% c(29, 30), "partido"] <- "Partido Colorado General Rivera"
#
l[l$partido == "RepresentÃ³ al Partido Socialista (33,34,35 y 36) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura %in% c(33, 34, 35, 36), "partido"] <- "Partido Socialista"
l[l$partido == "RepresentÃ³ al Partido Socialista (33,34,35 y 36) ____ RepresentÃ³ al Partido DemÃ³crata Cristiano (Frente Amplio) (42)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
#
l[l$partido == "Represento al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura == 42, "partido"] <- "Partido Frente Amplio"
l[l$partido == "Represento al Partido DemÃ³crata Cristiano (Frente Amplio) (42) ____ RepresentÃ³ al Partido Por el Gobierno del Pueblo (43)" & l$legislatura == 42, "partido"] <- "Partido Por el Gobierno del Pueblo"
#
l[l$partido == "RepresentÃ³ al Partido Nacional (38)  ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40)" & l$legislatura == 38, "partido"] <- "Partido Nacional"
l[l$partido == "RepresentÃ³ al Partido Nacional (38)  ____ RepresentÃ³ al Frente Izquierda de LiberaciÃ³n (39 y 40)" & l$legislatura %in% c(39, 40), "partido"] <- "Frente Izquierda de Liberacion"






























