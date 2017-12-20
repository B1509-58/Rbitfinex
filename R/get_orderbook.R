#' Get orderbook
#' @export
#' @importFrom httr GET
#' @importFrom httr http_error
#' @importFrom httr content
#' @importFrom jsonlite fromJSON

get_orderbook <- function(pair = 'btcusd'){
    url <- "https://api.bitfinex.com/v1/book/btcusd"
    resp <- GET(url)
    parsed <- jsonlite::fromJSON(httr::content(resp, "text"),
                                 simplifyVector = FALSE)

    timestamp <- head(resp)$headers$date

    bid <- t(sapply(parsed$bids,function(x) matrix(as.numeric(unlist(x))))[-3,])
    ask <- t(sapply(parsed$asks,function(x) matrix(as.numeric(unlist(x))))[-3,])

    return(list(timestamp,bid,ask))
}

