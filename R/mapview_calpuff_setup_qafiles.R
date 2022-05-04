#' mapview_met_domain
#'
#' mapview Calpuff setup meteorological domain
#'
#' @param qagrid.bna string path to Calpuff setup file qagrid.bna
#' @param epsg number epsg to set crs of the file domain
#' @param string_filename string to name the output files
#' @param name_of_map_layer string to name the mapview layer
#' @return mapview object exported as html and png files
#' @export

mapview_met_domain <- function(qagrid.bna, epsg = 32632, string_filename = 'file_name_met_domain', name_of_map_layer = 'layer_name_met_domain'){

  domain <- read_qagrid_bna(qagrid.bna, epsg = epsg, skip = 1, n_max = 5)

  # mapview
  map <- mapview::mapview(domain, color="green", layer.name = name_of_map_layer)

  rfunctions::export_mapview(map, string_filename)

}

#' mapview_comp_domain
#'
#' mapview Calpuff setup computational domain
#'
#' @param qagrid.bna string path to Calpuff setup file qagrid.bna
#' @param epsg number epsg to set crs of the file domain
#' @param string_filename string to name the output files
#' @param name_of_map_layer string to name the mapview layer
#' @return mapview object exported as html and png files
#' @export

mapview_comp_domain <- function(qagrid.bna, epsg = 32632, string_filename = 'file_name_comp_domain', name_of_map_layer = 'layer_name_comp_domain'){

  domain <- read_qagrid_bna(qagrid.bna, epsg = epsg, skip = 7, n_max = 5)

  # mapview
  map <- mapview::mapview(domain, color="yellow", layer.name = name_of_map_layer)

  rfunctions::export_mapview(map, string_filename)

}

#' mapview_samp_domain
#'
#' mapview Calpuff setup sampling domain
#'
#' @param qagrid.bna string path to Calpuff setup file qagrid.bna
#' @param epsg number epsg to set crs of the file domain
#' @param string_filename string to name the output files
#' @param name_of_map_layer string to name the mapview layer
#' @return mapview object exported as html and png files
#' @export

mapview_samp_domain <- function(qagrid.bna, epsg = 32632, string_filename = 'file_name_samp_domain', name_of_map_layer = 'layer_name_samp_domain'){

  domain <- read_qagrid_bna(qagrid.bna, epsg = epsg, skip = 13, n_max = 5)

  # mapview
  map <- mapview::mapview(domain, color="red", layer.name = name_of_map_layer)

  rfunctions::export_mapview(map, string_filename)

}

#' mapview_emi_points
#'
#' mapview Calpuff setup emission points
#'
#' @param qapnts.dat string path to Calpuff setup file emission points qapnts.dat
#' @param epsg number epsg to set crs of the emission points
#' @param string_filename string to name the output files
#' @param name_of_map_layer string to name the mapview layer
#' @return mapview object exported as html and png files
#' @export

mapview_emi_points <- function(qapnts.dat, epsg = 32632, string_filename = 'file_name_emi_points', name_of_map_layer = 'layer_name_emi_points'){

  emi_pts_sf <- read_qapnts_dat(qapnts.dat, epsg = epsg)

  # mapview
  map <- mapview::mapview(emi_pts_sf, layer.name = name_of_map_layer)

  rfunctions::export_mapview(map, string_filename)

}

#' mapview_disc_recs
#'
#' mapview Calpuff setup discrete receptors
#'
#' @param qarecd.dat string path to Calpuff setup file discrete receptors qarecd.dat
#' @param epsg number epsg to set crs of the discrete receptors
#' @param string_filename string to name the output files
#' @param name_of_map_layer string to name the mapview layer
#' @return mapview object exported as html and png files
#' @export

mapview_disc_recs <- function(qarecd.dat, epsg = 32632, string_filename = 'file_name_disc_rescs', name_of_map_layer = 'layer_name_disc_recs'){

  disc_recs_sf <- read_qarecd_dat(qarecd.dat, epsg = epsg)

  # mapview
  map <- mapview::mapview(disc_recs_sf, layer.name = name_of_map_layer)

  rfunctions::export_mapview(map, string_filename)

}

#' mapview_grid_recs
#'
#' mapview Calpuff setup grid receptors
#'
#' @param qarecg.dat string path to Calpuff setup file grid receptors qareg.dat
#' @param epsg number epsg to set crs of the grid receptors
#' @param string_filename string to name the output files
#' @param name_of_map_layer string to name the mapview layer
#' @return mapview object exported as html and png files
#' @export

mapview_grid_recs <- function(qarecg.dat, epsg = 32632, string_filename = 'file_name_grid_rescs', name_of_map_layer = 'layer_name_grid_recs'){

  grid_recs_sf <- read_qarecg_dat(qarecg.dat, epsg = epsg)

  # mapview
  map <- mapview::mapview(grid_recs_sf, layer.name = name_of_map_layer)

  rfunctions::export_mapview(map, string_filename)

}

#' mapview_qaterr_grd
#'
#' Create a mapview object from Calpuff setup grid file qaterr.grd and export as html and png files
#'
#' @param file_grd string path to the Calpuff setup grid file qaterr.grd
#' @param epsg number epsg to set crs in the raster object
#' @param string_filename string to name the output files
#' @param name_of_map_layer string to name the mapview layer
#' @return mapview object exported as html and png files
#' @export

mapview_calpuff_terr <- function(file_grd, epsg = 32632, string_filename = ' file_name_grid_terr', name_of_map_layer = 'layer_name_grid_terr'){

  grd <- read_qaterr_grd(file_grd, epsg)

  # eventually to hardcode the binning in mapview
  #my_bins<-c(0, 1, 2, 3, 4, 5, 10, 100, round(max(raster::values(grd)),0))
  #my_bins<-pretty(range(raster::values(grd)))

  # mapview
  map <- mapview::mapview(grd,
                          # define the palette
                          col.regions = grDevices::colorRampPalette(rev(RColorBrewer::brewer.pal(8, 'RdYlBu'))),
                          # here eventually define the binning
                          #at = my_bins,
                          na.color ='transparent',
                          alpha.region= 0.5,
                          legend.opacity=0.5,
                          layer.name = name_of_map_layer)


  rfunctions::export_mapview(map, string_filename)

}


