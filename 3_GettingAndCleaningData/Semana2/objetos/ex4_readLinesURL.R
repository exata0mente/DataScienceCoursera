con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
linesURL <- readLines(con)

nchar(linesURL)[c(10, 20, 30, 100)]

close(con)