#First, generate the deck (this is easier as a vector, unless you have other
#info attached to the cards):
cards <- as.character(outer(
      c(2:10, "J", "Q", "K", "A")
      , c("S", "H", "D", "C")
      , paste
      , sep = "_"
    ))
#Then, shuffle for this hand:
    
deckThisHand <- sample(cards)
#Set the index to deal the top card:
currCardToDeal <- 1
#Then, start dealing. Note, I included a variable to store the number to deal, 
#though this is not strictly necessary. Just makes it easier if you ever change 
#from hold-em to five card draw.
nToDeal <- 2
player1 <- deckThisHand[currCardToDeal:(currCardToDeal+nToDeal-1)]
currCardToDeal <- currCardToDeal+nToDeal-1
#Then, you can iterate over players:
player2 <- deckThisHand[currCardToDeal:(currCardToDeal+nToDeal-1)]
currCardToDeal <- currCardToDeal+nToDeal-1
player3 <- deckThisHand[currCardToDeal:(currCardToDeal+nToDeal-1)]
currCardToDeal <- currCardToDeal+nToDeal-1
