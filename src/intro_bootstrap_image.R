library(plotrix) #draw.circle()
library(RColorBrewer)
library(diagram) #curvedarrow()
library(infer)
library(tidyverse)
library(magick)

# Sample values
sample <- c(1, 2, 3, 5, 8, 9)
df <- data.frame(value = sample)
set.seed(10)
estimates <- rep_sample_n(df, size = 6, replace = T, reps = 1000) %>% 
        summarise(mean = mean(value))
svg("bootstrap.svg")
hist(estimates$mean, 
     col = "dodgerblue3", 
     yaxt = "n",
     xlab = "means", cex.lab = 5, ylab = "", main = "", xaxt = "n")
#ggplot(estimates, aes(mean)) +
#        geom_histogram(binwidth = 0.5, fill = "dodgerblue3", col = "lightgrey") + 
#        xlab("means") 
dev.off()

bootstrap <- image_read("bootstrap.svg")

svg("intro-bootstrap.svg")
# blank plot
par(mar=c(0, 0, 0, 0))
plot(1:10, 1:10, type="n",xlab="",ylab="",
     bty='n',
     yaxt="n", 
     xaxt = "n")

# set up
circle_size <- 0.85
circle_x <- 2
circle_y <- 5
xs <-  c(1.4, 1.5, 2, 2.3, 2.5, 2.7) # position of points
ys <-  c(4.7, 5.2, 4.6, 5.4, 4.8, 5)    # position of points

#sample
text(xs, ys, labels = c(paste(sample)))
text(circle_x, circle_y + 1., "Sample")
draw.circle(circle_x, circle_y, circle_size, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)

# arrows
added_x <- 2
added_y <- 2
arrows(circle_x + 0.7, circle_y + 0.6, circle_x + added_x , circle_y + added_y + 0.1, length = 0.1, lwd = 1)
text(circle_x + 0.8, circle_y + added_y, "sample with \n replacement", cex = 0.75)

# Bootstrap sample #1 
added_x <- 0.5 + added_x
added_y <-1 + added_y  
draw.circle(circle_x + added_x, circle_y + added_y, circle_size, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
text(circle_x + added_x, circle_y + added_y + 1.2, "Bootstrap \n Sample #1", cex = 1)

set.seed(1)
boot1 <- sample(sample, replace = T)
xs1 <-  xs + added_x # position of points
ys1 <-  ys + added_y
text(xs1, ys1, labels = c(paste(boot1)))

# means
text(circle_x + added_x + 2.5, circle_y + added_y, paste("mean =",round(mean(boot1))))

# Bootstrap sample #2 
added_y <- 0.2
draw.circle(circle_x + added_x, circle_y + added_y, circle_size, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
text(circle_x + added_x, circle_y + added_y + 1.2, "Bootstrap \n Sample #2", cex = 1)
arrows(circle_x + 0.85, circle_y, circle_x + 1.5, circle_y, length = 0.1, lwd = 1)

set.seed(2)
boot2 <- sample(sample, replace = T)
xs2 <-  xs + added_x # position of points
ys2 <-  ys + added_y
text(xs2, ys2, labels = c(paste(boot2)))

# means
text(circle_x + added_x + 2.5, circle_y + added_y, paste("mean =", round(mean(boot2))))


# Bootstrap sample #3
added_y <- -2.6
draw.circle(circle_x + added_x, circle_y + added_y, circle_size, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
text(circle_x + added_x, circle_y + 1.2 + added_y, "Bootstrap \n Sample #3", cex = 1)
arrows(circle_x + 0.7, circle_y - 0.7, circle_x + 1.6, circle_y - 2, length = 0.1, lwd = 1)

set.seed(3)
boot3 <- sample(sample, replace = T)
xs3 <-  xs + added_x # position of points
ys3 <-  ys + added_y
text(xs3, ys3, labels = c(paste(boot3)))

# means
text(circle_x + added_x + 2.5, circle_y + added_y, paste("mean =", round(mean(boot3))))

# last line
arrows(circle_x + 0.5, circle_y - 1, circle_x + 1.4, circle_y -3.8 , length = 0.1, lwd = 1)
text(circle_x + added_x, circle_y - 4, "keep sampling with \n replacement...", cex = 0.75)


# arrows to means
arrows(circle_x + 3.5,   circle_y + 3,  circle_x + 4.2,  circle_y +3, length = 0.1, lwd = 1)
arrows(circle_x + 3.5,   circle_y + 0.1,  circle_x + 4.2,  circle_y +0.1, length = 0.1, lwd = 1)
arrows(circle_x + 3.5,   circle_y - 2.7,  circle_x + 4.2,  circle_y - 2.7, length = 0.1, lwd = 1)

# bootstrap distribution
rasterImage(as.raster(bootstrap), 8,4,10,8)
text(circle_x + 7, circle_y +3, "Bootstrap \n distribution")

# arrows to bootstrap
arrows(circle_x + 5.5,  circle_y + 2.7,  circle_x + 6.5,  circle_y +0.5, length = 0.1, lwd = 1)
arrows(circle_x + 5.6,   circle_y + 0.1,  circle_x +6.4,  circle_y +0.1, length = 0.1, lwd = 1)
arrows(circle_x + 5.5,   circle_y - 2.4,  circle_x + 6.5,  circle_y -0.5, length = 0.1, lwd = 1)

dev.off()

