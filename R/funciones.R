#' Seleccionar emojis por rango afectivo
#'
#' Filtra los datos normativos devolviendo solo los emojis cuyas
#' medias caen dentro de los rangos indicados. Es util para
#' seleccionar estimulos al disenar un experimento (por ejemplo,
#' emojis de valencia negativa y activacion alta).
#'
#' @param poblacion Submuestra a usar. Por defecto \code{"general"}.
#' @param valencia Vector numerico de longitud 2 con el rango
#'   \code{c(min, max)} de \code{val_media}. Si es \code{NULL}, no
#'   filtra por valencia.
#' @param activacion Vector numerico de longitud 2 con el rango de
#'   \code{aro_media}. Si es \code{NULL}, no filtra por activacion.
#' @return Un data frame con las filas que cumplen los criterios.
#' @examples
#' # Emojis negativos y activantes en la norma general
#' seleccionar_emojis(valencia = c(1, 4), activacion = c(6, 9))
#' @export
seleccionar_emojis <- function(poblacion = "general",
                               valencia = NULL,
                               activacion = NULL) {
  emojis <- get("emojis", envir = asNamespace("emocionARemojis"))
  res <- emojis[emojis$poblacion == poblacion, , drop = FALSE]

  if (!is.null(valencia)) {
    if (length(valencia) != 2) {
      stop("'valencia' debe ser un vector de longitud 2: c(min, max).")
    }
    res <- res[res$val_media >= valencia[1] &
                 res$val_media <= valencia[2], , drop = FALSE]
  }

  if (!is.null(activacion)) {
    if (length(activacion) != 2) {
      stop("'activacion' debe ser un vector de longitud 2: c(min, max).")
    }
    res <- res[res$aro_media >= activacion[1] &
                 res$aro_media <= activacion[2], , drop = FALSE]
  }

  res
}

#' Resumen normativo de los emojis
#'
#' Calcula medias de las dimensiones afectivas para una submuestra,
#' util para describir rapidamente la base normativa.
#'
#' @param poblacion Submuestra a resumir. Por defecto \code{"general"}.
#' @return Un data frame de una fila con las medias de valencia,
#'   activacion y dominancia.
#' @examples
#' resumen_afectivo()
#' resumen_afectivo(poblacion = "Mujeres")
#' @export
resumen_afectivo <- function(poblacion = "general") {
  emojis <- get("emojis", envir = asNamespace("emocionARemojis"))
  sub <- emojis[emojis$poblacion == poblacion, , drop = FALSE]
  data.frame(
    poblacion  = poblacion,
    n          = nrow(sub),
    valencia   = round(mean(sub$val_media), 2),
    activacion = round(mean(sub$aro_media), 2),
    dominancia = round(mean(sub$dom_media), 2)
  )
}
