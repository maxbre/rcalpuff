
read_grd <- function(file_grd, epsg){

  #read grd as raster
  grd <- raster::raster(file_grd)


  # define the new extent by applying a transformation factor 10^3 from km to m
  new_extent <- raster::extent(raster::xmin(grd)*1000,
                               raster::xmax(grd)*1000,
                               raster::ymin(grd)*1000,
                               raster::ymax(grd)*1000)

  # set new extent
  grd <- raster::setExtent(grd, new_extent)


  # epsg 32632
  #crs_string <- "+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs"
  #crs_string <- 32632
  #crs_string <- "EPSG:32632"
  #crs_string <- sp::CRS(SRS_string = "EPSG:32632") # an sp CRS object
  #crs_string <- sf::st_crs(32632)$wkt # a WKT string

  # set raster crs
  #raster::crs(grd) <- crs_string
  raster::crs(grd) <- epsg

  # set raster crs
  raster::crs(grd) <- crs_string

  return(grd)

}

#
# calpuff_grd_mapview <- function(file_grd, layer_name){
#
#   # read grd as raster
#   grd<-raster::raster(file_grd)
#
#   # change slot extent from km to m (because of calpuff output)
#   raster::xmax(grd) <- raster::xmax(grd)*1000
#   raster::xmin(grd) <- raster::xmin(grd)*1000
#   raster::ymax(grd) <- raster::ymax(grd)*1000
#   raster::ymin(grd) <- raster::ymin(grd)*1000
#
#   # epsg 32632
#   crs <- "+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs"
#
#   # set raster crs
#   raster::crs(grd) <- crs
#
#   # mapview plot
#   mapview::mapview(grd,
#                    #define the palette
#                    col.regions = grDevices::colorRampPalette(rev(RColorBrewer::brewer.pal(8, 'RdYlBu'))),
#                    #at = my_bins,
#                    na.color ='transparent',
#                    alpha.region= 0.5,
#                    legend.opacity=0.5,
#                    layer.name = layer_name
#   )
# }
#
