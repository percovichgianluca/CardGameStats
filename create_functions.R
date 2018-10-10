# Restore deck function --------------------------------------------------------
restore_deck <- function(){
  deck_var <- c(rep.int('Ace', 4), 
                rep.int(as.character(2:9), 4), 
                rep.int('10', 16))
  return(deck_var)
}

# Draw and remove cards function -----------------------------------------------
draw_cards <- function(hand_var, deck_var, draw_size){
  for (i in 1:draw_size){
    card <- sample(deck_var, size = 1)
    deck_var <- deck_var[-(which(deck_var == card)[1])]
    hand_var <- c(hand_var,card)
  }
  return(list(hand_var, deck_var))
}

# Blackjack --------------------------------------------------------------------
blackjack <- function(player_hand, dealer_hand){
  # Check for blackjacks =======================================================
  b1 <- c('10', 'Ace')
  b2 <- c('Ace', '10')
  blackjack_player = blackjack_dealer <- FALSE
  if (identical(player_hand, b1) | identical(player_hand, b2)){
    blackjack_player = TRUE
  }
  if (identical(dealer_hand, b1) | identical(dealer_hand, b2)){
    blackjack_dealer = TRUE
  }
  # Output for victor ==========================================================
  if (blackjack_player & blackjack_dealer){
    cat('DRAW!\n')
  }
  else if (blackjack_player & !blackjack_dealer){
    cat('PLAYER WINS!\n')
  }
  else if (!blackjack_player & blackjack_dealer){
    cat('DEALER WINS!\n')
  }
  
  continue_check <- !(blackjack_player | blackjack_dealer) # False if blackjack
  return(continue_check)
}



