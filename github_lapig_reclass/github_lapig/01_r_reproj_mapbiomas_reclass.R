####################################################
# Claudinei Oliveira-Santos [claudineisan@pastoepixel.com]
# Isabela Nogueira de Macedo
####################################################

###
#' Packages, functions and configurations
library(terra)
library(tidyverse)

###
#' Input
#' Seleciona imagem raster
img <- rast('github_lapig/data/raster/mn_luziania_lucl_30m_2021.tif')

###
#' process

# Reclassificar
img[img %in% c(3, 4, 5, 6, 11, 12, 29, 32)] <- 1 #veg nativa
img[img %in% c(15)] <- 2 #pastagem
img[img %in% c(39)] <- 3 #soja
img[!img %in% c(NA, 1, 2, 3)] <- 4 #outros usos


###
#' output
#' Salva o raster em uma pasta selecionada
writeRaster(img, 'github_lapig/cache/raster/mn_luziania_lucl_30m_2021_reclass.tif')

###################################################
