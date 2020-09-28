# Untangling Panhandled Spreadsheets

For ease of interaction in a spreadsheet, people will often "join" together a parent dataset and a child dataset together in the same tab or sheet in a way that doesn't repeat parent data over and over. For example, let's say you have a parent dataset (e.g., companies) and a child dataset (e.g., contacts at those companies). 

## Parent Dataset

| A | B |
| ----------- | ----------- |
| valueA1 | valueB1 |
| valueA2 | valueB2 | 
   
## Child Dataset

| A | C | D |
| ----------- | ----------- | ----------- |
| valueA1 | valueC1 | valueD1 |
| valueA2 | valueC2 | valueD2 | 
| valueA1 | valueC3 | valueD3 |
| valueA1 | valueC4 | valueD4 | 
| valueA2 | valueC5 | valueD5 |
| valueA2 | valueC6 | valueD6 | 

| A | C | D |
| ----------- | ----------- | ----------- |
| valueA1 | valueC1 | valueD1 |
| valueA1 | valueC3 | valueD3 |
| valueA1 | valueC4 | valueD4 | 
| valueA2 | valueC2 | valueD2 | 
| valueA2 | valueC5 | valueD5 |
| valueA2 | valueC6 | valueD6 | 
