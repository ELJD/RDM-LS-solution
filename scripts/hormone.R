#Day 3####
#Setting working directory ####
folder <- "D:/trainingen/zelfgegeven/Rintro/exercises"
setwd(folder)

Hormone <- read.csv2("Rdata/Hormone.csv")
Hormone
names(Hormone)[3] <- "conc"

p2 <- ggplot(Hormone, aes(Drug,conc)) +
	          stat_summary(fun.y=mean,geom="bar") +
		              stat_summary(fun.data=mean_cl_normal,geom="errorbar",
					                                           width=0.25) + geom_point() +
  coord_flip()

ggarrange(p1,p2,ncol=1)
