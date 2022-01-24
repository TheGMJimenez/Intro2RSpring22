#Module 2 Assignment : Basic R Functions & Data Structures
#Dated 1-23-22

#Evaluate the function myMean:

assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

#Original code: 

myMean <- function(assignment2){
  return(sum(assignment2)/length(assignment2)) }

#My Version
myMean2 <- mean(assignment2) 
myMean3 <- sum(assignment2)/length(assignment2)


#Calling the function by using different methods
myMean #This calls back the function but doesnt produce a number

#All of the below results lead to 19.25
myMean(assignment2)
myMean2
myMean3

