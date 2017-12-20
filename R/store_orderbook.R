#' Live Scrapper (whenever this file is running it gets the current orderbook snapshot and stores it)
#' @export
#'
store_orderbook <- function(exc='bitfinex', l = NA){
    if(is.na(l)) l <- get_orderbook(exc)
    print(l)
    dir.create(file.path(exc), showWarnings = FALSE)
    saveRDS(l, file=paste0(exc,'/orderbook_',l[[1]],'.rds'))
}
