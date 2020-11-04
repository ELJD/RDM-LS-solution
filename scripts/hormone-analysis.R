# Analysis of file hormone.csv #

# This script analyzes the dataset of the hormone experiment performed on 01/01/2020. 
# It contains the statistical analysis and plotting of figure 2D of the paper. 

# Setting working directory. Change the path to the folder of this project. Here the folder is called RDM-LS.
folder <- "~/RDM-LS"
setwd(folder)

# Import libraries. (if not already installed, install the packages by uncommenting following line)
#install.packages('ggplot2')
library(ggplot2)

# Import dataset with proper name handling & rename third column. 
hormone <- read.csv2("data/20201102-hormone.csv")
names(hormone)[3] <- "Concentration"
hormone

# Open a pdf file where the plot will be saved
png(file = "results/plots/20201104-effect-drug-concentration.png", width=600, height=350) 

# Create plot effect of drug A and B on concentration of substance X measured in blood of patients. 
ggplot(hormone, aes(Drug,Concentration)) +
  stat_summary(fun=mean, geom="bar") +
  stat_summary(fun.data=mean_cl_normal, geom="errorbar", width=0.25) + geom_point() +
  coord_flip()

# Close the file handle
dev.off()
