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

  export_mapview(map, string_filename)

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

  export_mapview(map, string_filename)

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

  export_mapview(map, string_filename)

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
  map <- mapview::mapview(emi_pts_sf, color="red", layer.name = name_of_map_layer)

  export_mapview(map, string_filename)

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
  map <- mapview::mapview(disc_recs_sf, color="red", layer.name = name_of_map_layer)

  export_mapview(map, string_filename)

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
  map <- mapview::mapview(grid_recs_sf, color="red", layer.name = name_of_map_layer)

  export_mapview(map, string_filename)

}

# here goes the code for the mapview qaterr_grd, recycle from previous scripts mapview_calpost_grd.R
