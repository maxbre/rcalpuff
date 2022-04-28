#' mapview_met_domain
#'
#' Read Calpuff setup meteorological domain
#'
#' @param qagrid_bna string path to Calpuff setup file qagrid.bna
#' @param epsg number epsg to set crs of the domain
#' @param string_filename string to name the output files
#' @param name_of_map_layer string to name the mapview layer
#' @return mapview object exported as html and png files
#' @importFrom magrittr %>%
#' @export


mapview_met_domain <- function(qagrid_bna, epsg, string_filename, name_of_map_layer){

  x <- y <- NULL

  # meteorological grid
  met_domain <- readr::read_csv(qagrid_bna, col_names = c("x", "y"), skip = 1, n_max = 5)%>%
    dplyr::mutate(x = x*1000, y = y*1000)

  # transform to linestring
  met_domain <- sf::st_linestring(as.matrix(met_domain), dim = "XY")

  # create geometry and add crs
  met_domain <- sf::st_sfc(met_domain, crs = epsg)

  # plot
  map <- mapview::mapview(met_domain, color="green", layer.name = name_of_map_layer)

  export_mapview(map, string_filename)

}

