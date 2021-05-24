```{r}
Data_Import<- function(fileimport=){ 
  ############
  # Function imports all CSV files at a particular location,
  #  Groups by specific value and merges them,
  #  Returns the merged dataset
  ######
  
  # Required packages
  if(!require(dplyr))install.packages("dplyr")
  library(dplyr)
  if(!require(dplyr))install.packages("dplyr")
  library(dplyr)
  
  # Using the file location, import all csv files
  tbl <-  list.files(path = fileimport  ,
                     pattern = "*.csv", 
                     full.names = T) %>% 
    map_df(~read_csv(., col_types = cols(.default = "c"))) 
  
  # Rename the data and clean csv names by removing " " and "."
  data <-  rename_with(tbl, ~ tolower(gsub(" ", ".", .x, fixed = TRUE)))
  
  # Return data as output
  return(data)
}