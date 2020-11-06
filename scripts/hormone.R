##Analysis hormone.csv###
#Setting working directory ####
folder <- "C:/users/Documents/hormone-project/scripts"
setwd(folder)

Hormone <- read.csv2("data/Hormone.csv")
Hormone
names(Hormone)[3] <- "conc"

p2 <- ggplot(Hormone, aes(Drug,conc)) +
	          stat_summary(fun.y=mean,geom="bar") +
		              stat_summary(fun.data=mean_cl_normal,geom="errorbar",
					                                           width=0.25) + geom_point() +
  coord_flip()

p2
