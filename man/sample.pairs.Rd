% Generated by roxygen2 (4.0.1): do not edit by hand
\name{sample.pairs}
\alias{sample.pairs}
\title{Sample random profile pairs with given relationship (sibs, parent/offspring, etc.)}
\usage{
sample.pairs(N = 1, type = "FS", freqs)
}
\arguments{
\item{N}{The number of pairs to be sampled (integer).}

\item{type}{A character string giving the type of relative. Should be one of \link{ibdprobs}, e.g. "FS" (full sibling) or "PO" (parent/offspring) or "UN" (unrelated).}

\item{freqs}{A list specifying the allelic frequencies. Should contain a vector of allelic frequencies for each locus, named after that locus.}
}
\value{
A list containing two integer matrices of class \code{profiles}:
         \enumerate{
           \item \code{x1} An integer matrix with \eqn{N} profiles.
           \item \code{x2} An integer matrix with \eqn{N} profiles.
         }
}
\description{
Sample random profile pairs with given relationship (sibs, parent/offspring, etc.)
}
\details{
The function randomly samples \eqn{N} pairs of DNA profiles according to the specified allelic frequencies. It returns two matrices containing profiles. The \eqn{i}'th profile in the first and the second matrix are sampled as relatives.
}
\examples{
## Compare the number of IBS alleles of simulated parent/offspring pairs
## with simulated unrelated pairs

data(freqsNLsgmplus)

#sample PO pairs and UN pairs
po.pairs <- sample.pairs(N=10^4,"PO",freqsNLsgmplus)
unr.pairs <- sample.pairs(N=10^4,"UN",freqsNLsgmplus)

#count the IBS alleles
po.pairs.ibs <- ibs.pairs(x1=po.pairs$x1,x2=po.pairs$x2)
unr.pairs.ibs <- ibs.pairs(x1=unr.pairs$x1,x2=unr.pairs$x2)

#plot together in a histogram
hist(po.pairs.ibs$ibs,breaks=0:20,xlim=c(0,20),
col="#FF0000FF",main="PO pairs vs. UN pairs",xlab="IBS")
hist(unr.pairs.ibs$ibs,breaks=0:20,col="#0000FFBB",add=TRUE)
}
\seealso{
\code{\link{sample.profiles}}, \code{\link{sample.relatives}},\code{\link{ki.pairs}},\code{\link{ibs.pairs}}
}

