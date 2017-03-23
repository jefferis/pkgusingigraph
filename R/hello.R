#' Try to set igraph vs.es option when computing neighborhood
#'
#' @param g A graph (defaults to a 10 member ring)
#' @param set.vs.es Whether to set the igraph vs.es option (default \code{TRUE})
#'
#' @export
#'
#' @importFrom igraph igraph_opt igraph_options neighborhood
set_igraph_option <- function(g=igraph::make_ring(10), set.vs.es=TRUE) {
  if(set.vs.es) {
    ov=igraph_opt("return.vs.es")
    igraph_options(return.vs.es=FALSE)
  }
  n=neighborhood(g, 1, mode='out')
  if(set.vs.es)
    igraph_options(return.vs.es=ov)
}
