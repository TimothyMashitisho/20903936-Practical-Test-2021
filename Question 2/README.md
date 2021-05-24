Question 2 Answer: Forbes
================
20903936
24/05/2021

\#Data Import

``` r
library(plyr)
library(readr)
library(tidyverse)
dir()
mydir = "/Users/mathlogonolomashitisho/Desktop/Economics Masters /Semester 1/Data Science/20903936 Practical Test/20903936-Practical-Test-2021/Question 2/data"
myfiles = list.files(path=mydir, pattern=".csv", full.names=TRUE)
myfiles
```

``` r
#To upload all files and create a dataset 
data_csv = ldply(myfiles, read_csv)

glimpse(data_csv)
```

    ## Rows: 2,755
    ## Columns: 7
    ## $ Name     <chr> "Issad Rebrab & family", "Marcos Galperin", "Alejandro Bulghe…
    ## $ NetWorth <chr> "$4.8 B", "$6.1 B", "$3.3 B", "$2.4 B", "$2.2 B", "$1.3 B", "…
    ## $ Country  <chr> "Algeria", "Argentina", "Argentina", "Argentina", "Argentina"…
    ## $ Source   <chr> "food", "e-commerce", "oil & gas", "oil & gas", "pharmaceutic…
    ## $ Rank     <dbl> 589, 440, 925, 1299, 1444, 2263, 70, 87, 145, 150, 195, 205, …
    ## $ Age      <chr> "77", "N/A", "76", "85", "94", "88", "67", "59", "41", "41", …
    ## $ Industry <chr> "Food & Beverage", "Technology", "Energy", "Energy", "Healthc…

``` r
#transforming the NetWorth to factor

data_csv_real<- data_csv %>% mutate(NetWorth = as.factor(NetWorth),Age=as.factor(Age))

glimpse(data_csv_real)
```

    ## Rows: 2,755
    ## Columns: 7
    ## $ Name     <chr> "Issad Rebrab & family", "Marcos Galperin", "Alejandro Bulghe…
    ## $ NetWorth <fct> $4.8 B, $6.1 B, $3.3 B, $2.4 B, $2.2 B, $1.3 B, $23.6 B, $20.…
    ## $ Country  <chr> "Algeria", "Argentina", "Argentina", "Argentina", "Argentina"…
    ## $ Source   <chr> "food", "e-commerce", "oil & gas", "oil & gas", "pharmaceutic…
    ## $ Rank     <dbl> 589, 440, 925, 1299, 1444, 2263, 70, 87, 145, 150, 195, 205, …
    ## $ Age      <fct> 77, N/A, 76, 85, 94, 88, 67, 59, 41, 41, 88, 60, 90, N/A, 80,…
    ## $ Industry <chr> "Food & Beverage", "Technology", "Energy", "Energy", "Healthc…

\#Quick plot: Global Billionaire Age Distribution

The plot shows that

``` r
 e <- ggplot(data=data_csv_real,aes(Age,NetWorth)) +
  geom_histogram() +
  ggtitle("Billionaire Age vs NetWorth Distribution")  +
   theme_classic() +
    ylab ("Net Worth")+
    xlab("Age")

e
```

\#Quickplot 2 Ten Least Billionare

``` r
least_10 <- data_csv_real %>% arrange(Age,NetWorth) %>% head(10)
least_10
```

    ##                    Name NetWorth       Country            Source Rank Age
    ## 1   Kevin David Lehmann   $3.3 B       Germany        drugstores  925  18
    ## 2    Alexandra Andresen   $1.4 B        Norway       investments 2141  24
    ## 3           Wang Zelong   $1.5 B         China         chemicals 2035  24
    ## 4    Katharina Andresen   $1.4 B        Norway       investments 2141  25
    ## 5        Austin Russell   $2.4 B United States                 ★ 1299  26
    ## 6  Gustav Magnar Witzoe   $4.4 B        Norway      fish farming  655  27
    ## 7             Andy Fang     $2 B United States food delivery app 1580  28
    ## 8          Stanley Tang     $2 B United States food delivery app 1580  28
    ## 9         Jonathan Kwok   $2.4 B     Hong Kong       Real Estate 1299  29
    ## 10    Sam Bankman-Fried   $8.7 B United States    cryptocurrency  274  29
    ##                 Industry
    ## 1       Fashion & Retail
    ## 2            Diversified
    ## 3        Metals & Mining
    ## 4            Diversified
    ## 5             Automotive
    ## 6        Food & Beverage
    ## 7             Technology
    ## 8             Technology
    ## 9            Real Estate
    ## 10 Finance & Investments

It looks like the youngest billionaire is Kevin David Lehmann, worth
$3.3B. He is from germany and is in the retail and fashion industry.

\#Conlcusion

It seems that the
