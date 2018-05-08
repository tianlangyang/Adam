#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(leaflet)
library(plyr)
library(shiny)


#Shiny interactive map for retweet count
d <- read.csv("total.csv", row.names = 1)
d <- mutate(d, popup_info=paste(sep = "<br/>", paste0("<b>",d$screenName, "</b>"), paste0 ("retweet count: ", d$retweetCount), paste0 ("sentiment score: ",d$score)))

factorpal<- colorFactor(
  palette = "RdPu",
  domain = c(d$retweetCount),
  level = NULL,
  ordered= FALSE, 
  na.color = "#808080"
)

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()

ui <- fluidPage(
  leafletOutput("PopularityMap"),
  p()
)

server <- function(input, output, session) {
  
  output$PopularityMap <- renderLeaflet({
    leaflet(d) %>%
      addTiles(
      ) %>%  # Add default OpenStreetMap map tiles
      addCircleMarkers(lng=~lon,
                       lat = ~lat, 
                       popup= ~popup_info,
                       radius = 3,
                       color = ~factorpal(d$retweetCount),
                       fillOpacity = 1) %>%
      addProviderTiles("Stamen.Watercolor") %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView(lng = -96.71289, lat = 37.09024, zoom = 4)
  })
}

shinyApp(ui, server)