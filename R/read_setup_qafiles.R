#' read_qagrid_bna
#'
#' Read Calpuff setup domain
#'
#' @param qagrid.bna string path to Calpuff setup file qagrid.bna
#' @param epsg number epsg to set crs of the file domain
#' @param skip number of rows to skip
#' @param n_max max number of rows to read
#' @return sf object Calpuff domain
#' @keywords internal

read_qagrid_bna <- function(qagrid.bna, epsg = 32632, skip, n_max){

  x <- y <- NULL

  # domain
  domain <- readr::read_csv(qagrid.bna, col_names = c("x", "y"), skip = skip, n_max = n_max, show_col_types = FALSE)%>%
    dplyr::mutate(x = x*1000, y = y*1000)

  # transform to linestring
  domain <- sf::st_linestring(as.matrix(domain), dim = "XY")

  # create geometry and add crs
  domain <- sf::st_sfc(domain, crs = epsg)

  domain

}

#' read_qapnts_dat
#'
#' Read Calpuff setup emission points
#'
#' @param qapnts.dat string path to Calpuff setup file emission points qapnts.dat
#' @param epsg number epsg to set crs of the emission points
#' @return sf object Calpuff emission points
#' @keywords internal

read_qapnts_dat <- function(qapnts.dat, epsg = 32632){

  x <- y <- elev <- emi_source <- NULL

  # emission points
  emi_pts <- readr::read_table(qapnts.dat, skip= 1, col_names=c("x", "y", "elev", "emi_source"), show_col_types = FALSE)%>%
    dplyr::mutate(x = x*1000, y = y*1000)

  # transform df to sf
  emi_pts_sf <- sf::st_as_sf(x = emi_pts,
                         coords = c("x", "y"),
                         crs = epsg)

  emi_pts_sf

}

#' read_qarecd_dat
#'
#' Read Calpuff setup discrete receptors
#'
#' @param qarecd.dat string path to Calpuff setup file discrete receptors qarecd.dat
#' @param epsg number epsg to set crs of the discrete receptors
#' @return sf object Calpuff discrete receptors
#' @keywords internal

read_qarecd_dat <- function(qarecd.dat, epsg = 32632){

  x <- y <- elev <- z <- NULL

  # discrete receptors
  disc_rec <- readr::read_table(qarecd.dat, skip= 1, col_names=c("x", "y", "elev", "z"), show_col_types = FALSE)%>%
    dplyr::mutate(x = x*1000, y = y*1000)

  # transform df to sf
  disc_rec_sf <- sf::st_as_sf(x = disc_rec,
                             coords = c("x", "y"),
                             crs = epsg)

  disc_rec_sf

}

#' read_qarecg_dat
#'
#' Read Calpuff setup grid receptors
#'
#' @param qarecg.dat string path to Calpuff setup file grid receptors qarecg.dat
#' @param epsg number epsg to set crs of the grid receptors
#' @return sf object Calpuff grid receptors
#' @keywords internal

read_qarecg_dat <- function(qarecg.dat, epsg = 32632){

  x <- y <- elev <- NULL

  # discrete receptors
  grid_rec <- readr::read_table(qarecg.dat, skip= 1, col_names=c("x", "y", "elev"), show_col_types = FALSE)%>%
    dplyr::mutate(x = x*1000, y = y*1000)

  # transform df to sf
  grid_rec_sf <- sf::st_as_sf(x = grid_rec,
                              coords = c("x", "y"),
                              crs = epsg)

  grid_rec_sf

}

#' read_qaterr_grd
#'
#' Read Calpuff setup file terrain grid
#'
#' @param qaterr.grd string path to Calpuff setup terrain grid file
#' @param epsg number epsg to set crs in the raster object
#' @return raster object
#' @keywords internal

read_qaterr_grd <- function(qaterr.grd, epsg = 32632){

  #read grd as raster
  grd <- raster::raster(qaterr.grd)

  # define the new extent by applying a transformation factor 10^3 from km to m
  # remember calpuff is using km as distance units
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

  grd

}
