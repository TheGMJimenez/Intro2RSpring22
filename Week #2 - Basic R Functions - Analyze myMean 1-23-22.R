#Module 2 Assignment : Basic R Functions & Data Structures
#Dated 1-23-22

#Evaluate the function myMean:

assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

#Original code: myMean <- function(assignment2) { return(sum(assignment2)/length(assignment2)) }

#The original code originally doesnt work, because of an unexpected "{}"

#My Version
myMean <- mean(assignment2) 

myMean2 <- sum(assignment2)/length(assignment2)

#Calling the function by usind different method
myMean
myMean2

#both results use 19.25