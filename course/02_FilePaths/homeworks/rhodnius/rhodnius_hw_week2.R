### Take home problems:

####### Problem 1 -----

# create directory
dir.create(path = "/Volumes/RhodniusUSB/TargetFolder")

#### define paths
origin_dir <- "/Users/juancamilosanchezarcila/Flow_Cytometry/CytometryInR/course/03_InsideFCSFile/data/"
dest_dir <- "/Volumes/RhodniusUSB/TargetFolder"

#### define full path
files_origin <- list.files(origin_dir, full.names = TRUE, recursive = FALSE, pattern = ".fcs")

##### Copy the files
file_copy(files_origin, dest_dir, overwrite = TRUE)

####### Problem 2 -----

list.files(origin_dir, full.names = TRUE, recursive = TRUE)

#generates:
#[1] "/Users/juancamilosanchezarcila/Flow_Cytometry/CytometryInR/course/03_InsideFCSFile/data//AdditionalFCSFiles/2025_07_26_AB_02_NY068_02_Ctrl.fcs"
#[2] "/Users/juancamilosanchezarcila/Flow_Cytometry/CytometryInR/course/03_InsideFCSFile/data//AdditionalFCSFiles/2025-10_22_Contrad.fcs"            
#[3] "/Users/juancamilosanchezarcila/Flow_Cytometry/CytometryInR/course/03_InsideFCSFile/data//BioconductorDownloads.csv"                            
#[4] "/Users/juancamilosanchezarcila/Flow_Cytometry/CytometryInR/course/03_InsideFCSFile/data//BioconductorFlow.csv"                                 
#[5] "/Users/juancamilosanchezarcila/Flow_Cytometry/CytometryInR/course/03_InsideFCSFile/data//CellCounts4L_AB_05_ND050_05.fcs"                      

dirname(origin_dir)

# generates: 
#[1] "/Users/juancamilosanchezarcila/Flow_Cytometry/CytometryInR/course/03_InsideFCSFile"

####### Problem 3 -----

flowsom_files <- system.file("extdata", package = "FlowSOM")
list.files(flowsom_files, full.names = TRUE, recursive = TRUE, , pattern = ".fcs")

# the file present from FlowSom is:
#[1] "/Library/Frameworks/R.framework/Versions/4.4-x86_64/Resources/library/FlowSOM/extdata/68983.fcs"


###### code to test during presentation ----


### load packages
library(flowCore)

#### Start code ----
getwd()

#### check files in my path
my_files <- list.files(path = "course/03_InsideFCSFile/data/")


### did not work
loadedFCS <- read.FCS(my_files[4], transformation = FALSE, truncate_max_range = FALSE)

# worked
loadedFCS <- read.FCS("course/03_InsideFCSFile/data/CellCounts4L_AB_05_ND050_05.fcs", 
transformation = FALSE, 
truncate_max_range = FALSE)

#flow
myflowframe <- flowFrame(loadedFCS@exprs)

str(myflowframe)
class(myflowframe)

myflowframe_names <- colnames(myflowframe)

### subsetting
MFI_matrix <- myflowframe@exprs

head(MFI_matrix, 5)
colnames(MFI_matrix)

MFI_matrix[,1]
MFI_matrix[1,]
View(MFI_matrix)


loadedFCS@description


### to indicate a path
# new folder location <- file.path("folder1", "folder2", etc...)
# new folder location <- file.path("folder1/folder2", etc...) ### will only witk with people with the same OS

# to create a folder
dir.create()

# to see folder content
list.files(path="target", full.names = "FALSE", recursive = "FALSE")

list.files(path="target", full.names = "FALSE", recursive = "FALSE", pattern = ".fcs") # to search for specific files or patterns

### when the pattern in more complicated, we use stringr
str_detect(filepath, "IFN"))

#### to copy a file
file.copy(from = "path1", to = "path2")

