setwd("C:\\Users\\Daniel Atzberger\\Documents\\SNCS")
# library
library(ggplot2)


df <- read.csv('coherence_u_mass.csv')

cols <- c("#1f78b4", "#b2df8a",
          "#33a02c", "#fb9a99", "#e31a1c")


p <- ggplot(df, aes(fill=model_type, y=coherence_u_mass, x=category)) +
  ggtitle("Comparison of Topic Models concerning Coherence")+
  geom_bar(position="dodge", stat="identity")+
  theme(panel.background = element_blank())+
  xlab("Number of Topics") +
  ylab("Coherence")+
  scale_fill_manual(values = cols)+
  theme_minimal() +
  theme(panel.grid.major = element_line(color = "gray", size = 0.2))+
  labs(fill = "")+
  theme(axis.text.x = element_text(size = 25), axis.text.y = element_text(size = 25),
        axis.title=element_text(size=25,face="bold"),
        title = element_text(size=25, face="bold"))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position = "bottom")+
  theme(legend.text = element_text(size = 25))+
  guides(fill = guide_legend(nrow = 1))
p+coord_cartesian(ylim=c(0.1,0.7))


df$group <- rep(1:7, length.out = nrow(df))

ggplot(df, aes(fill=model, y=value, x=category)) + 
  geom_bar(position = position_dodge(width = 0.7), stat = "identity") +
  theme(panel.background = element_blank()) +
  xlab("Custom X-Axis Label") +
  ylab("Custom Y-Axis Label") +
  scale_fill_manual(values = cols) +
  theme_minimal() +
  theme(panel.grid.major = element_line(color = "gray", size = 0.2)) +
  scale_x_discrete(labels = df$category) +
  scale_y_continuous(limits = c(0.3, NA)) +
  facet_grid(cols = vars(group), scales = "free_x", space = "free_x")


# ab hier Beispiele
# create a dataset
specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
value <- abs(rnorm(12 , 0 , 15))
data <- data.frame(specie,condition,value)

# Grouped
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="dodge", stat="identity")
