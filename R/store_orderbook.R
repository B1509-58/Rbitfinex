#' Live Scrapper (whenever this file is running it gets the current orderbook snapshot and stores it)
#' @export
#'
store_orderbook <- function(l=get_orderbook(), folder='bitfinex'){
    print(l)
    save(l,paste0('./',folder,'/',l$timestamp)
}
