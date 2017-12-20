#' Live Scrapper (whenever this file is running it gets the current orderbook snapshot and stores it)
#' @export
#'
store_orderbook <- function(l=get_orderbook(), folder='bitfinex'){
    print(l)
    saveRDS(l, file=paste0(folder,'/orderbook_',l[[1]],'.rds'))
}
