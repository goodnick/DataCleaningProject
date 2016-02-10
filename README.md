DataCleaningProject
===================
by Nick Menere 10 Feb 2016

There are 4 files in this project:

* run\_analysis.R - the script that generates the dataset
* download\_data.R - download function that run\_analysis.R uses to download and unzip datafile
* README.md - this file
* CodeBook.md - a description of the dataset

### Data
The script will download and store locally the datafile to the "data" directory. It will then unzip it for processing.

## Output
The script will create 3 output files:

* datafile\_info.txt - This contains the url and date of when the datafile was downloaded.
* tidy\_data.txt - The tidy data for the first part of the assignment.  See Codebook.mb for a dscription of this data.
* summary\_data.txt - This contains summary data for teh second part of the assignment. See Codebook.mb for a dscription of this data.