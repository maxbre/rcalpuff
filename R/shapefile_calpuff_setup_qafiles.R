#' shapefile_emi_points
#'
#' shapefile Calpuff setup emission points
#'
#' @param qapnts.dat string path to Calpuff setup file emission points qapnts.dat
#' @param epsg number epsg to set crs of the emission points
#' @param string_filename string to name the output files
#' @return shapefile of the emission points
#' @export

shapefile_emi_points <- function(qapnts.dat, epsg = 32632, string_filename = 'file_name_emi_points'){

  emi_pts_sf <- read_qapnts_dat(qapnts.dat, epsg = epsg)

  # set name of shapefile
  emi_pts_shp <- paste0('./', string_filename, '.shp')

  # create shapefile, eventually overwrite it
  sf::st_write(emi_pts_sf, emi_pts_shp, delete_layer = TRUE)

}

#' shapefile_disc_recs
#'
#' shapefile Calpuff setup discrete receptors
#'
#' @param qarecd.dat string path to Calpuff setup file discrete receptors qarecd.dat
#' @param epsg number epsg to set crs of the discrete receptors
#' @param string_filename string to name the output files
#' @return shapefile of the discrete receptors
#' @export

shapefile_disc_recs <- function(qarecd.dat, epsg = 32632, string_filename = 'file_name_disc_recs'){

  disc_recs_sf <- read_qarecd_dat(qarecd.dat, epsg = epsg)

  # set name of shapefile
  disc_recs_shp <- paste0('./', string_filename, '.shp')

  # create shapefile, eventually overwrite it
  sf::st_write(disc_recs_sf, disc_recs_shp, delete_layer = TRUE)

}


#' shapefile_grid_recs
#'
#' shapefile Calpuff setup grid receptors
#'
#' @param qarecg.dat string path to Calpuff setup file grid receptors qarecg.dat
#' @param epsg number epsg to set crs of the grid receptors
#' @param string_filename string to name the output files
#' @return shapefile of the grid receptors
#' @export

shapefile_grid_recs <- function(qarecg.dat, epsg = 32632, string_filename = 'file_name_grid_recs'){

  grid_recs_sf <- read_qarecg_dat(qarecg.dat, epsg = epsg)

  # set name of shapefile
  grid_recs_shp <- paste0('./', string_filename, '.shp')

  # create shapefile, eventually overwrite it
  sf::st_write(grid_recs_sf, grid_recs_shp, delete_layer = TRUE)

}
