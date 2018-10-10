# Restore deck function --------------------------------------------------------
restore_deck <- function(){
  deck_var <- c(rep.int('Ace', 4), 
                rep.int(as.character(2:10), 4), 
                rep.int('Face', 12))
}

# Draw and remove cards function --------------------------------------------------------
draw_cards <- function(hand_var, deck_var, draw_size){
  for (i in 1:draw_size){
    card <- sample(deck_var, size = 1)
    deck_var <- deck_var[-(which(deck_var == card)[1])]
    hand_var <- c(hand_var,card)
  }
  return(list(hand_var, deck_var))
}




