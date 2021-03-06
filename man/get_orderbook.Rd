% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_orderbook.R
\name{get_orderbook}
\alias{get_orderbook}
\title{Get orderbook}
\usage{
get_orderbook(exc = "bitfinex", level = 5)
}
\arguments{
\item{exc}{str Name of the exchange (default = 'bitfinex')}

\item{level}{Required orderbook level (default = 5, upper bound = 25)}
}
\value{
List with Timestamp (Unix-format), Ask Side (Price and Quantity), Bid (Price and Quantity)
}
\description{
This function scraps data from the orderbook API of a number of Exchanges
Currently implemented are *bitfinex, coinbase, bitstamp, cex, btcc, binance, bittrex, kraken*, and *bitflyer*
}
