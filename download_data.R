## Methods to download and unzip
## Downlaod the datafile and store locally.
## Only downloads and unzips if the files don't exist locally
downloadActivityDataSet <- function() {
    urlLocation <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    path <- file.path(".", "data")
    if (!dir.exists(path)) {
        dir.create(path)
    }

    zipFileName <- file.path(path, "UCIHARDataset.zip")
    if(!file.exists(zipFileName)) {
        message("Downloading Data")
        download.file(urlLocation, zipFileName, "curl")
        output_path <- file.path(".", "output")
        if (!dir.exists(output_path)) {
            dir.create(output_path)
        }
        message("Create datafile info")
        file_conn <- file(file.path(output_path, "datafile_info.txt"))
        data_info <- c("The dataset was generated from the datafile - UCIHARDataset.zip",
                 paste("Downloaded from -", urlLocation),
                 paste("at", Sys.time()))
        writeLines(data_info, con = file_conn)
        close(file_conn)
    }

    data_set_dir <- file.path(path, "UCI HAR Dataset")
    if(!dir.exists(data_set_dir)) {
        message("Unzipping Data")
        unzip(zipFileName, exdir = path)
        message("Unzipped Data")
    }
    data_set_dir

}