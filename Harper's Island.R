HI_File <- read.csv("C:/Users/.../.../.../.../.../Harper's Island Views and Rating (csv).csv")
library(ggplot2)
pacman::p_load(jpeg, ggplot2, grid) #loads multiple packages at once
HI_Poster <- jpeg::readJPEG("C:/.../.../.../.../.../Harper.jpg"
#Line 4 loads Harper's Island Poster
#The /.../.../.../... in lines 1 and 4 are just working directories and folders the program needs to go through to find the desired file.

#Harper's Island Rating
Episode_Rate <- data.frame(Episode = HI_File$Episode, IMDB_Rating = HI_File$IMDB_Rating)
Ratings_Plot <- ggplot(data = Episode_Rate, mapping = aes(x = Episode_Rate$Episode, y = Episode_Rate$IMDB_Rating, label = HI_File$Episode_Title)) + xlab("Episode") + ylab("IMDB Rating") + ggtitle("Harper's Island Rating") + 
  geom_point(col = "black") + scale_x_continuous(breaks = seq(1,13,1)) + scale_y_continuous(breaks = seq(7,8.5,.1)) + geom_text(vjust = 1, size = 2.75) + geom_line(col = "skyblue1") + theme(axis.title.x = element_text(size = 9), axis.title.y = element_text(size = 9)) +
  scale_fill_continuous(guide = FALSE) + annotation_custom(rasterGrob(HI_Poster, width = unit(1,"npc"), height = unit(1,"npc"), interpolate = FALSE), 9,13,7.1,7.6) +
  annotate("text", x = 2, y = 8.0, label = "Created by Iftiar Rana", hjust= -.475, vjust= -1, col="red", cex= 3.5, fontface = "bold", alpha = 1)
Ratings_Plot
#annotation_custom is to attach the poster to the graph and where (on both axes) on the graph
#annotate is used as a watermark

#Harper's Island Views
Episode_Views <- data.frame(Episode = HI_File$Episode, Views = HI_File$Views..Millions.)
Views_Plot <- ggplot(data = Episode_Views, mapping = aes(x = Episode_Views$Episode, y = Episode_Views$Views)) + xlab("Episode") + ylab("Number of Views (in Millions)") + ggtitle("Harper's Island Viewership") +
  geom_point(col = "black") + scale_x_continuous(breaks = seq(1,13,1)) + scale_y_continuous(breaks = seq(3,11,1)) +
  geom_text(vjust = 1.4, size = 2.75, label = Episode_Views$Views) + geom_line(col = "red3") + theme(axis.title.x = element_text(size = 9), axis.title.y = element_text(size = 9)) + 
  scale_fill_continuous(guide = FALSE) + annotation_custom(rasterGrob(HI_Poster, width = unit(1,"npc"), height = unit(1,"npc"), interpolate = FALSE), 5,Inf,5,Inf) + 
  annotate("text", x = 1, y = 3, label = "Created by Iftiar Rana", hjust= .10, vjust= -.15, col="red", cex= 3.5, fontface = "bold", alpha = 1) 
Views_Plot

# Harper's Island Views + IMDB Rating 
HI_Views_Rates <- data.frame(Episode = HI_File$Episode, IMDB_Rating = HI_File$IMDB_Rating, Views_in_Millions = HI_File$Views..Millions.)
library(dplyr)
library(patchwork)
library(hrbrthemes)
Ratings_Views <- ggplot(data = HI_Views_Rates, aes(HI_File$Episode)) + 
  geom_line(aes(y = HI_Views_Rates$IMDB_Rating, colour = "IMDB Rating")) + geom_line(aes(y = HI_Views_Rates$Views_in_Millions, colour = "Number of Views (in Millions)")) + geom_point(y = HI_Views_Rates$IMDB_Rating) +
  geom_point(y = HI_Views_Rates$Views_in_Millions) + scale_x_continuous(breaks = seq(1,13,1)) + xlab("Episode")  +
  ylab("IMDB Rating") + ggtitle("Harper's Island Ratings and Views") + scale_y_continuous(sec.axis = sec_axis(~./1, name = "Number of Views (in Millions)")) +
  scale_fill_continuous(guide = FALSE) + annotation_custom(rasterGrob(HI_Poster, width = unit(1,"npc"), height = unit(1,"npc"), interpolate = FALSE), 1,3,3,6.5) +
  annotate("text", x = 2, y = 8, label = "Created by Iftiar Rana", hjust= -.475, vjust= -1, col="red", cex= 3.5, fontface = "bold", alpha = 1) + 
  scale_colour_manual(values = c("skyblue", "red3")) + theme(legend.position = c(0.8,0.9)) + theme(axis.title.x = element_text(size = 9), axis.title.y = element_text(size = 9))
Ratings_Views
# ~./1 is the proportion rate you want to set for the second y-axis. In this case it means both y-axes have the same scale
