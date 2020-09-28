if(!require(readxl)) {install.packages("readxl"); library(readxl)}
if(!require(janitor)) {install.packages("janitor"); library(janitor)}
if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)}
if(!require(tidyr)) {install.packages("tidyr"); library(tidyr)}
if(!require(readr)) {install.packages("readr"); library(readr)}

original_df <- read_excel("data/original.xlsx")

#clear any blank rows used to separate parent/child groupings
original_df <- remove_empty(original_df, which = "rows")


# Set up the parent dataframe ---------------------------------------------

#non-blank cells in the first column are assumed to be parent rows, so save them
parent_df <- original_df %>% 
  filter(!is.na(.[[1]])) 

#fill the blanks cells in column 1 with the last non-blank value in that column
#(working down) and save just this one column
original_df_col1 <- fill(original_df, 1) %>% select(1)

# Set up the child dataframe ----------------------------------------------

#create a working dataframe, throw out the rows that were saved in parent_df, and
#remove any blank columns
working_df <- original_df %>% 
  filter(is.na(.[[1]])) %>% 
  remove_empty(which="cols")

#use the name of the first column in the working dataframe along with the ordered 
#list of column names in the original dataframe to find what column number is the
#start of the child columns  
child_start_column <- which(colnames(original_df) == colnames(working_df)[1])

#use this info to drop the parent columns from the child dataframe
child_df <- original_df[,-1:-(child_start_column-1)]

#add the column of names from the parent first column saves before
child_df <- bind_cols(child_df,original_df_col1)

write_csv(child_df,"data/child.csv", na="")

# Finish the parent dataframe ---------------------------------------------

#drop the child columns from the parent dataframe
parent_df <- parent_df[,1:(child_start_column-1)]

write_csv(parent_df,"data/parent.csv", na="")

