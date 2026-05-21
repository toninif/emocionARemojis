test_that("el dataset emojis se carga y tiene la estructura esperada", {
  data(emojis, package = "emocionARemojis")

  expect_s3_class(emojis, "data.frame")
  expect_setequal(
    as.character(unique(emojis$poblacion)),
    c("general", "Mujeres", "Hombres")
  )
  expect_true(all(c("emoji", "val_media", "aro_media", "dom_media") %in%
                    names(emojis)))
})

test_that("seleccionar_emojis filtra correctamente", {
  res <- seleccionar_emojis(valencia = c(1, 5))
  expect_true(all(res$val_media >= 1 & res$val_media <= 5))
  expect_true(all(res$poblacion == "general"))

  data(emojis, package = "emocionARemojis")
  res_todo <- seleccionar_emojis()
  expect_equal(nrow(res_todo), sum(emojis$poblacion == "general"))
})

test_that("seleccionar_emojis valida los argumentos", {
  expect_error(seleccionar_emojis(valencia = c(1, 2, 3)))
  expect_error(seleccionar_emojis(activacion = c(5)))
})

test_that("resumen_afectivo devuelve una fila", {
  r <- resumen_afectivo()
  expect_equal(nrow(r), 1)
  expect_true(all(c("valencia", "activacion", "dominancia") %in%
                    names(r)))
})
