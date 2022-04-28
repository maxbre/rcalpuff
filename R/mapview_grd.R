#' mapview_grd
#'
#' Create a mapview from Calpuff grd file, export as html and png
#'
#' @param file_grd string path to the Calpuff input file name *.grd
#' @param epsg number epsg to set crs in the raster object
#' @param string_filename string to name the output files
#' @param name_of_map_layer string to name the mapview layer
#' @export

mapview_grd <- function(file_grd, epsg, string_filename, name_of_map_layer){

  grd <- read_grd(file_grd, epsg)

  # eventually to hardcode the binning in mapview
  #my_bins<-c(0, 1, 2, 3, 4, 5, 10, 100, round(max(raster::values(grd)),0))
  #my_bins<-pretty(range(raster::values(grd)))

  # mapview
  map <- mapview::mapview(grd,
                   #define the palette
                   col.regions = grDevices::colorRampPalette(rev(RColorBrewer::brewer.pal(8, 'RdYlBu'))),
                   #at = my_bins,
                   na.color ='transparent',
                   alpha.region= 0.5,
                   legend.opacity=0.5,
                   layer.name = name_of_map_layer)


  export_mapview(map, string_filename)

}




