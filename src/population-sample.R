library(plotrix) #draw.circle()
library(RColorBrewer)
library(diagram) #curvedarrow()
#library(shape)
#library(igraph)
#display.brewer.all(colorblindFriendly = TRUE)
svg("img/population_vs_sample.svg")
mycolours <- brewer.pal(12, "Paired")
blues <- brewer.pal(9, "Blues")

# blank plot
par(mar=rep(0,4))
plot(-50:150, seq(-100,100,length=201),type="n",xlab="",ylab="",
     bty='n', 
     yaxt="n", 
     xaxt = "n")

# generating points 
set.seed(1)
r <- sample(seq(0, 50, by = 1), size = 50, replace = F)
degs <- 360*sample(seq(0, 50, by = 0.02), size = 50, replace = F)

#  convert the degrees to radians
theta <- 2*pi*degs/360

# Add a circle around the points
#draw.circle(0, 0, 50, nv=100, border=NULL, col=blues[1], lty=1, density=NULL, angle=45,lwd=1)

# Plot your points by converting to cartesian
points(1*r*sin(theta),1*r*cos(theta), xlim=c(-max(r),max(r)),ylim=c(-max(r),max(r)),
       col= mycolours[c(2,6)], pch = 16,  cex = 1)

# Circles around the sampled points
draw.circle(-41, 8, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
draw.circle(-19, -34, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
draw.circle(-2, -14, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
draw.circle(0, 27, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
draw.circle(11, 42, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
draw.circle(34.3, 36, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
draw.circle(37, -31, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
draw.circle(-9, 9.5, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
draw.circle(-2, 16, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)
draw.circle(44.3, 20.5, 3, nv=100, border="black", col=NA, lty=1, density=NULL, angle=45,lwd=1)

#draw.circle(85, -20, 20, nv=100, border="black", col=Blues[1], lty=1, density=NULL, angle=45,lwd=1)
# Sampled points 
points(c(125, 99, 91, 92, 95, 120, 100, 110, 100, 110, 105), c(0, -10, 2, 8, -50, -45, -30, -15, -30, -30, 0),
       col= mycolours[c(2, 6, 2,2 ,2, 6, 2, 6, 6,2)], pch = 16, cex = 1)

# population box 
rect(-50, -55, 55, 70)

# sample box
rect(75, -55, 145, 29)

text(-20, 80, "Population", font= 2)
text(0, 60, "All undergraduate \n students in North America")
text(110, 20, "10 undergraduate \n students in North America")
text(95, 35, "Sample", font = 2)

#iArrows <- igraph:::igraph.Arrows
#iArrows(0, 46, 90, 12,
#        h.lwd=2, sh.lwd=2, sh.col="black",
#        curve=1.1 , width=1, size=1)

#big arrow
curvedarrow(c(0,70), c(110,32), lwd = 2, lty = 1, lcol = "black", 
            arr.col = "black", arr.pos = 1, curve = -0.3, dr = 0.1, 
            endhead = T)
text(0, -80, "Parameter", font = 2)
text(0, -92, 
     "unknown p \n (proportion of population who own an iPhone)")

text(110, -80, "Statistic", font = 2)

text(110, -90, expression(italic(hat(p)) * "= 6/10 = 0.60" ))
text(110, -98, "(proportion of sample who own an iPhone)")
curvedarrow(c(90, -81), c(35,-81), lwd = 2, lty = 1, lcol = "black", 
            arr.col = "black", arr.pos = 1, curve = 0, dr = 0.1, 
            endhead = T)
text(60, -72, "Point Estimation", font = 2)

arrows(0, -50, 0, -75, length = 0.1, lwd = 2)
arrows(110, -50, 110, -75, length = 0.1, lwd = 2)
#curvedarrow(c(0, -65), c(0,-75), lwd = 2, lty = 1, lcol = "black", 
#            arr.col = "black", arr.pos = 4, curve = 0, dr = 1, 
 #           endhead = T)

legend(120, 80, legend=c("Has iPhone", "No iPhone"),
       col=mycolours[c(2, 6)], pch = 16, cex=0.8)
dev.off()

