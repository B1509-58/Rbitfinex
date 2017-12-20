Data scrapper to access *bitfinex*, *coinbase*, *bitstamp* orderbook data conveniently via *R*. 

To install, just use

    library(devtools)
    install_github('voigtstefan/Rbitfinex')
    library('Rbitfinex')

To get orderbook data simply type for example

    get_orderbook(exc = 'coinbase', level = 5)

To store orderbook data conveniently use 

    store_orderbook(exc = 'coinbase') 

The resulting file contains a list with the orderbook of the corresponding exchange (BTC/ USD) up to the first 5 levels (can be adjuted using the parameters). The files are stored in a subfolder names after the exchange. 
