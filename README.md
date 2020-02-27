# News Scraper

This repo contains the source code for download all the ads information from a local newspaper. 

The purpose, have a spanish ads dataset for train a text classifier for comertial categories, this text data is labeled in the news paper web page ( Rent, Sell, Automovil sell, house sell).

Also this dataset allow us to create a semantic word search engine.


The scraper just downloads the information from the "Ads" section.
Is posible also to download information from all the aviable sections in the webpage.


The target newspaper page:


 [http://lapatriaenlinea.com/!](http://lapatriaenlinea.com/).

<div style="text-align:center"><img src ="https://github.com/stanlee321/web_scraping/blob/master/images/newspaper.png" /></div>


## Requirements:

* Python 3.6 >
* Selenium web driver
  
## How to run:

For single thread 
```
$ python scraper_laPatria.py
```

For multi thread 
```
$ python scraper_laPatria_multipro.py
```


This outputs a  .csv file into the folder `data/` with the extracted information.



## Android APP

The android app shows the actual extracted information form the newspaper. 

<div style="text-align:center"><img src ="https://github.com/stanlee321/web_scraping/blob/master/images/android.png" /></div>