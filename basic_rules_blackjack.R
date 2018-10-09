# Create vector for card draw --------------------------------------------------
deck <- c(rep.int('Ace', 4), 
              rep.int(as.character(2:10), 4), 
              rep.int('Face', 12))
restore_deck <- function()
deck
s <- sample(x = deck, size = 2, replace = FALSE)
s
remove_cards <- function(deck_var, sample_var){
  deck_var <- deck_var[-(which(deck_var %in% sample_var[1])[1])]
  deck_var <- deck_var[-(which(deck_var %in% sample_var[2])[1])]
  return(deck_var)
}
deck <- remove_cards(deck,s)
deck
n = 1000
pb = txtProgressBar(min = 0, max = n, initial = 0, style = 3) 
for (i in 1:n){
  hands <- c(hands,sample(x = deck, size = 2, replace = FALSE))
  setTxtProgressBar(pb,i)
}
table(hands)

# Initialize dealer and player hands -------------------------------------------

# remove drawn cards from deck between re drawings
