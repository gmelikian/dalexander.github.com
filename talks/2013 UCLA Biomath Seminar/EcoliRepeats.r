#
# MUMmer based analysis of repeats in E. Coli
#   % nucmer --maxmatch --nosimplify -l 250 --prefix=seq_seq \
#      ~/Data/References/ecoli_mutated/sequence/ecoli_mutated.fasta \
#      ~/Data/References/ecoli_mutated/sequence/ecoli_mutated.fasta
#   % show-coords -r seq_seq.delta > seq_seq.coords
# Then some manual edition of seq_seq.coords in org mode -> seq_seq.csv

# Note that MUMmer is showing *all* pairwise comparisons of E. Coli
# against itself, so each point we plot is a comparison, not a repeat
# element.  The repeat elements are linked together in a clique.

library(ggplot2)

tbl <- read.csv("seq_seq.csv", header=TRUE)
pdf("img/ecoli-repeats.pdf", width=4, height=3.6)
print(qplot(RepeatLength, RepeatIdentity, data=tbl,
      ylab="Repeat Identity (%)", xlab="Repeat Length"))
dev.off()
