## Grab raw files from Google Drive (only have to do this once) 
require(googledrive)
data_folder_names <- drive_ls(path = "Viz Lit Data 2019 to Current",
                              pattern = "Coder: RJ|Coder: Andrew",
                              recursive = T)

dir.create(file.path(getwd(),"/AccData"), showWarnings = F)
old_wd <- getwd()
setwd(file.path(getwd(),"/AccData"))


for (i in 1:2){ 
  temp_files <- drive_ls(data_folder_names$name[i]) 
  n_files <- dim(temp_files)[1] 
  for (j in 1:n_files){ 
    drive_download(temp_files[j,], overwrite = T)
  } 
} 

setwd(old_wd)
