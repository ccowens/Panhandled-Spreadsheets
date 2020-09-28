# Untangling Panhandled Spreadsheets

For ease of interaction in a spreadsheet, people will often "join" together a parent dataset and a child dataset together in the same tab or sheet in a way that doesn't repeat parent data over and over. For example, let's say you have a parent dataset (e.g., companies) and a child dataset (e.g., contacts at those companies). 

## The Panhandled Dataset

### Parent Dataset

| A | B |
| ------- | ------- |
| valueA1 | valueB1 |
| valueA2 | valueB2 |

### Child Dataset

| A | C | D |
| ------- | ------- | ------- |
| valueA1 | valueC1 | valueD1 |
| valueA2 | valueC2 | valueD2 |
| valueA1 | valueC3 | valueD3 |
| valueA1 | valueC4 | valueD4 |
| valueA2 | valueC5 | valueD5 |
| valueA2 | valueC6 | valueD6 |

### Panhandling Them Together

1. Join together with A as the common column

| A | B | C | D |
| ------- | ------- | ------- | ------- |
| valueA1 | valueB1 | valueC1 | valueD1 |
| valueA1 | valueB1 | valueC3 | valueD3 |
| valueA1 | valueB1 | valueC4 | valueD4 |
| valueA2 | valueB2 | valueC2 | valueD2 |
| valueA2 | valueB2 | valueC5 | valueD5 |
| valueA2 | valueB2 | valueC6 | valueD6 |

2. Drop redundant "parent" data

| A       | B       | C       | D       |
| ------- | ------- | ------- | ------- |
| valueA1 | valueB1 | valueC1 | valueD1 |
|         |         | valueC3 | valueD3 |
|         |         | valueC4 | valueD4 |
| valueA2 | valueB2 | valueC2 | valueD2 |
|         |         | valueC5 | valueD5 |
|         |         | valueC6 | valueD6 |

### Untangling the Dataset

#### Assumptions

- The different "pans" (parent with children) can be separated by blank lines or not.
- All information except the "pans" has been deleted.
- The first column contains the keys for the parent and child datasets

#### Process

1. Read in the spreadsheet as our original table to work with
2. In the original table, clear any blank rows used to separate parent/child groupings
3. In the original table, collect together the rows with first columns that aren't blank and store in the parent table
4. From the original table, fill the blanks cells in column 1 with the last non-blank value in that column (working down)
5. Save just column 1 into a one-column (key) table we will use later
6. From the original table, create a temporary table consisting of only the rows that are blank in the first column
7. Using this temporary table, get the name of the first column in this table to figure out which number column is the beginning of the child columns in the original (where the panhandle meets the pan)
8. Use this information to drop the columns that aren' t child columns and bind the remaining columns with the single key column created above to make a child table
9. Return to the parent table to drop the columns that aren't parent columns 
10. Save out the the two new tables