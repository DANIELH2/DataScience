a <- (10:20)
a
b <- LETTERS
b1 <- b[c(4:13)]
b1
f <- c(1,1,1,0,0,0,0,0)
f1 <- factor(f, levels=c(0,1), labels=c("YES","NO"))
f1
help("objects")
.Ob <- 1
ls(pattern = "O")
ls(pattern= "O", all.names = TRUE)    # also shows ".[foo]"

