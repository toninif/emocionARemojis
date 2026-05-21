# data-raw/DATASET.R
# -----------------------------------------------------------------
# Toma el CSV crudo de emojis y genera el objeto de datos del
# paquete (data/emojis.rda).
#
# El CSV emojis_crudo.csv esta en formato estandar:
#   - separador coma
#   - decimales con punto
#   - codificacion UTF-8 sin BOM
#
# Cuando actualices los datos, exporta el nuevo CSV con ese mismo
# formato (o reexporta desde el xlsx) y volve a correr este script.
#
# Para ejecutarlo:  source("data-raw/DATASET.R")
# -----------------------------------------------------------------

emojis <- read.csv(
  "data-raw/emojis_crudo.csv",
  stringsAsFactors = FALSE,
  encoding = "UTF-8",
  check.names = FALSE
)

# Eliminar la columna de indice de exportacion (sin valor analitico)
emojis$indice <- NULL

# Asegurar encoding UTF-8 en la columna de emojis.
# Sin esto, algunos sistemas muestran los emojis incorrectamente.
Encoding(emojis$emoji) <- "UTF-8"

# poblacion como factor con orden explicito
emojis$poblacion <- factor(
  emojis$poblacion,
  levels = c("general", "Mujeres", "Hombres")
)

# Chequeos rapidos (se pueden borrar)
cat("Filas:", nrow(emojis), "\n")
cat("Emojis unicos:", length(unique(emojis$emoji)), "\n")
print(table(emojis$poblacion))

# Guardar como objeto del paquete (escribe data/emojis.rda)
usethis::use_data(emojis, overwrite = TRUE)
