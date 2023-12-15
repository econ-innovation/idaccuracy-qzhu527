rm(list = ls()) 
setwd("/Users/zhuqiong/Downloads/同步空间/IdeaLab/第四讲/test")

###############
#要求data.frame中至少要包括论文的doi号，发表年份，杂志，标题；
#使用apply家族函数替代上述步骤中的for循环
#将2中代码封装成为一个可以在命令行运行的脚本，脚本的唯一一个参数为aminer论文文件所在的路径。
###############
# Q1
# import all files in the assignment_idaccuracy/Aminer folder 
# extract all file names 
path <- "/Users/zhuqiong/Downloads/同步空间/EcoBigData/data/assignment_idaccuracy/Aminer"
files <- list.files(path, full.names = TRUE, recursive = TRUE)
df <- data.frame()
for(filepath in files){
  data <- data.frame(read.csv(filepath))
  df <- rbind(df, data)
  }
 

#Q2
path <- "/Users/zhuqiong/Downloads/同步空间/EcoBigData/data/assignment_idaccuracy/Aminer"
files <- list.files(path, full.names = TRUE, recursive = TRUE)
final_data <- do.call(rbind, lapply(files, function(file){
  # Use read.csv function to read the file
  data <- data.frame(read.csv(file))
  return(data)
}))


#Q3
# Function to read and process Aminer files
read_aminer_files <- function(path) {
  files <- list.files(path, full.names = TRUE, recursive = TRUE)
  final_data <- do.call(rbind, lapply(files, function(file){
    # Use read.csv function to read the file
    data <- data.frame(read.csv(file))
    return(data)
  }))
}

aminer_path <- "/Users/zhuqiong/Downloads/同步空间/EcoBigData/data/assignment_idaccuracy/Aminer"
# Call the function with the provided Aminer path
merged_data <- read_aminer_files(aminer_path)

# Print or do further processing with merged_data
head(merged_data)
