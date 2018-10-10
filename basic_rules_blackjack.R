# Add functions to environment
library(zeallot)
source('create_functions.R')

# Initialize dealer and player hands -------------------------------------------
player <- c()
dealer <- c()
deck <- restore_deck()

c(player,deck) %<-% draw_cards(player,deck,1) # %<-% operator from zeallot package
c(dealer,deck) %<-% draw_cards(dealer,deck,1)
c(player,deck) %<-% draw_cards(player,deck,1) 
c(dealer,deck) %<-% draw_cards(dealer,deck,1) 