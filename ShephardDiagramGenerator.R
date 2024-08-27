setwd("C:\\Users\\Daniel Atzberger\\Documents\\SNCS")

library(ggplot2)
df <- read.csv('ShephardDiagram.csv')
sampled_df <- df[sample(nrow(df), size = 250000), ]

ggplot(sampled_df, aes(x = x, y = y)) +
  geom_point(size = 1.0, color = "blue") +  # Set points to blue
  theme(panel.grid.major = element_blank(),
        panel.background = element_blank(),
        panel.border = element_rect(color = "black", fill = NA, size = 1),  # Add black box
        legend.position = "none",
        axis.ticks.length = unit(0, "pt"),
        axis.text.x = element_text(size = 0),
        axis.text.y = element_text(size = 0)) + 
  labs(x="", y="")

