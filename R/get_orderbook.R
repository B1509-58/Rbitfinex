#' Get orderbook
#' @description This function scraps data from the orderbook API of a number of Exchanges
#' Currently implemented are *bitfinex, coinbase, bitstamp, cex, btcc, binance, bittrex, kraken*, and *bitflyer*
#' @param exc str Name of the exchange (default = 'bitfinex')
#' @param level Required orderbook level (default = 5, upper bound = 25)
#' @return List with Timestamp (Unix-format), Ask Side (Price and Quantity), Bid (Price and Quantity)
#' @export
#' @importFrom jsonlite fromJSON

get_orderbook <- function(exc = 'bitfinex', level = 5){

    if(exc=='bitfinex') url <- "https://api.bitfinex.com/v1/book/btcusd"
    if(exc=='coinbase') url <- "https://api.gdax.com/products/BTC-USD/book?level=2"
    if(exc=='bitstamp') url <- "https://www.bitstamp.net/api/order_book/"
    if(exc =='cex') url <- paste0("https://cex.io/api/order_book/BTC/USD/?depth=",level)
    if(exc=='btcc') url <- paste0("https://spotusd-data.btcc.com/data/pro/orderbook?symbol=BTCUSD&limit=",level)
    if(exc=='binance') url <- paste0("https://api.binance.com/api/v1/depth?symbol=BTCUSDT&limit=", level)
    if(exc=='bittrex') result <- get_orderbook_bittrex(level=level)
    if(exc=='kraken') result <- get_orderbook_kraken(level=level)
    if(exc=='bitflyer') url <- "https://api.bitflyer.com/v1/board?product_code=BTC_USD"

    if(!exc%in%c('kraken', 'bittrex')){
        parsed <- jsonlite::fromJSON(url, simplifyVector = FALSE)
        if(exc=='bitfinex') timestamp <- as.numeric(parsed[[1]][[1]]$timestamp)
        if(exc=='coinbase') timestamp <- as.numeric(Sys.time())
        if(exc=='bitstamp') timestamp <- as.numeric(parsed$timestamp)
        if(exc=='cex') timestamp <- as.numeric(parsed$timestamp)
        if(exc=='btcc') timestamp <- as.numeric(parsed$date)
        if(exc=='binance') timestamp <- as.numeric(Sys.time())
        if(exc=='bitflyer') timestamp <- as.numeric(Sys.time())

        bid <- t(sapply(parsed$bids,function(x) matrix(as.numeric(unlist(x))))[-3,1:level])
        ask <- t(sapply(parsed$asks,function(x) matrix(as.numeric(unlist(x))))[-3,1:level])
        result <- list(timestamp=timestamp,bid=bid,ask=ask)
    }


    return(result)

}

