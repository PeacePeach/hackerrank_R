#-----Day 4: Binomial Distribution I-----

library(dplyr)

pbinom(2, 6, prob = 1.09/2.09, lower.tail = FALSE) %>% round(., 3) %>% as.character() %>% writeLines()


#-----Day 4: Binomial Distribution II-----

library(dplyr)

#No more than 2 rejects
pbinom(2, 10, prob = 0.12, lower.tail = TRUE) %>% round(., 3) %>% as.character() %>% writeLines()

#At least 2 rejects
pbinom(1, 10, prob = 0.12, lower.tail = FALSE) %>% round(., 3) %>% as.character() %>% writeLines()


#-----Day 4: Geometric Distribution I-----

library(dplyr)

dgeom(x = 4, prob = 1/3)%>% round(., 3) %>% as.character() %>% writeLines()


#-----Day 4: Geometric Distribution II-----

library(dplyr)

pgeom(q = 4, prob = 1/3)%>% round(., 3) %>% as.character() %>% writeLines()
