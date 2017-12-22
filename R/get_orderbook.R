#' Get orderbook
#' @export
#' @importFrom jsonlite fromJSON

get_orderbook <- function(exc = 'bitfinex', level = 5){

    if(exc=='bitfinex') url <- "https://api.bitfinex.com/v1/book/btcusd"
    if(exc=='coinbase') url <- "https://api.gdax.com/products/BTC-USD/book?level=2"
    if(exc=='bitstamp') url <- "https://www.bitstamp.net/api/order_book/"
    if(exc =='cex') url <- "https://cex.io/api/order_book/BTC/USD/?depth=5"

    parsed <- jsonlite::fromJSON(url,
                                 simplifyVector = FALSE)

    if(exc=='bitfinex') timestamp <- as.numeric(parsed[[1]][[1]]$timestamp)
    if(exc=='coinbase') timestamp <- as.numeric(Sys.time())
    if(exc=='bitstamp') timestamp <- as.numeric(parsed$timestamp)
    if(exc=='cex') timestamp <- as.numeric(parsed$timestamp)

    bid <- t(sapply(parsed$bids,function(x) matrix(as.numeric(unlist(x))))[-3,1:level])
    ask <- t(sapply(parsed$asks,function(x) matrix(as.numeric(unlist(x))))[-3,1:level])

    return(list(timestamp=timestamp,bid=bid,ask=ask))

}

