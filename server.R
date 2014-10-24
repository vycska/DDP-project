library(shiny)

type <- function(d) {
  paste(d,ifelse(d==0,"",ifelse(d==90,"right",ifelse(d==180,"straight",ifelse(d==360,"complete",ifelse(d<90,"acute",ifelse(d<180,"obtuse","reflex")))))))
}

plotAngles <- function(d,l) {
  par(mar=c(0,0,0,0))
  plot(0,0,type="p",xlim=c(-6,6),ylim=c(-6,6),asp=1,frame=FALSE)
  abline(h=0,lty="dashed")
  abline(v=0,lty="dashed")
  
  r <- pi*d/180
  
  x <- 5*cos(r)
  y <- 5*sin(r)
  
  t <- seq(0,d,length=100)
  tr <- pi*t/180
  tx <- cos(tr)
  ty <- sin(tr)
  
  tt <- seq(d,360,length=100)
  ttr <- pi*tt/180
  ttx <- cos(ttr)
  tty <- sin(ttr)
  
  lines(c(0,x),c(0,y),lwd="4",col="red")
  lines(c(0,5),c(0,0),lwd=4,col="blue")
  
  if(l==TRUE) {
    lines(tx,ty,lwd=2,col="red")
    lines(ttx,tty,lwd=2,col="blue")
    type1 <- type(d)
    type2 <- type(360-d)
    text(2.5*cos(pi*d/360),2.5*sin(pi*d/360),type1,col="red",cex=3)
    text(-2.5*cos(pi*d/360),-2.5*sin(pi*d/360),type2,col="blue",cex=3)
  }
}

shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({plotAngles(input$d,input$l)})
  }
)