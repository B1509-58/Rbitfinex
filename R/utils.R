#' Get orderbook (Kraken)
#' @description This function scraps data from the orderbook API of Kraken
#' @param level Required orderbook level (default = 5, upper bound = 25)
#' @return List with Timestamp (Unix-format), Ask Side (Price and Quantity), Bid (Price and Quantity)
#' @export
#' @importFrom jsonlite fromJSON

get_orderbook_kraken <- function(level = 5){

    url <- "https://api.kraken.com/0/public/Depth?pair=XBTUSD"
    parsed <- jsonlite::fromJSON(url, simplifyVector = FALSE)
    timestamp <- as.numeric(Sys.time())
    ask <- t(sapply(parsed$result$XXBTZUSD$asks,function(x) matrix(as.numeric(unlist(x))))[-3,1:5])
    bid <- t(sapply(parsed$result$XXBTZUSD$bids,function(x) matrix(as.numeric(unlist(x))))[-3,1:5])

    return(list(timestamp=timestamp,bid=bid,ask=ask))

}

#' Get orderbook (bittrex)
#' @description This function scraps data from the orderbook API of Kraken
#' @param level Required orderbook level (default = 5, upper bound = 25)
#' @return List with Timestamp (Unix-format), Ask Side (Price and Quantity), Bid (Price and Quantity)
#' @export
#' @importFrom jsonlite fromJSON
#'
get_orderbook_bittrex <- function(level = 5){

    url <- "https://bittrex.com/api/v1.1/public/getorderbook?market=USDT-BTC&type=both"
    parsed <- jsonlite::fromJSON(url, simplifyVector = FALSE)
    ask <- t(sapply(parsed$result$buy,function(x) matrix(as.numeric(unlist(x))))[-3,1:5])
    bid <- t(sapply(parsed$result$sell,function(x) matrix(as.numeric(unlist(x))))[-3,1:5])
    timestamp <- as.numeric(Sys.time())

    return(list(timestamp=timestamp,bid=bid,ask=ask))

}



