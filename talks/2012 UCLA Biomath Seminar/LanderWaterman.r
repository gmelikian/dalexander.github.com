# Lander-Waterman statistics.
#  These estimates are ideal in the sense that \theta -> 0.
#  Also I call contigs what they call "islands"---1 or more reads.
#
library(ggplot2)
library(plyr)

EColi    <- 5e6
CElegans <- 1e8
Human    <- 3e9


ExpectedNumContigsIdeal <- function(G, L, C)
{
  (G*C/L)*exp(-C)
}

ExpectedContigLengthIdeal <- function(G, L, C)
{
  L*(exp(C)-1)/C
}


Conditions = expand.grid(ReadLength = c(100, 3000), Coverage=1:30)
G <- Human

tbl <- ddply(Conditions, .(ReadLength, Coverage), function(df) {
  data.frame(nContig   = ExpectedNumContigsIdeal(G, df$ReadLength, df$Coverage),
             contigLen = ExpectedContigLengthIdeal(G, df$ReadLength, df$Coverage))
})


qplot(Coverage, nContig, color=factor(ReadLength), data=tbl) + geom_line() + scale_y_log10()

qplot(Coverage, contigLen, color=factor(ReadLength), data=tbl) + geom_line() + scale_y_log10()
