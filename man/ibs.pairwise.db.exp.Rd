% Generated by roxygen2 (4.0.1): do not edit by hand
\name{ibs.pairwise.db.exp}
\alias{ibs.pairwise.db.exp}
\title{Expected number of fully/partially matching loci when two profiles are compared}
\usage{
ibs.pairwise.db.exp(freqs1, freqs2 = freqs1, k = "UN")
}
\arguments{
\item{freqs1}{List of allelic frequencies.}

\item{freqs2}{List of allelic frequencies.}

\item{k}{IBD-probabilities, passed on to \code{\link{ibdprobs}}. Defaults to "UN", i.e. unrelated.}
}
\value{
Matrix with the expected number of full/partial matches on 0,1,2,... loci.
}
\description{
When a database profile is compared with another database profile, this function computes the expected number of pairs match fully or partially for each number of loci.
}
\details{
When all profiles in the database are compared pairwise, one can count the number of profiles that match fully/partially for each number of loci. Such a procedure is implemented as \code{\link{ibs.pairwise.db}}. The current function computes the expected value of the counts.
}
\examples{
data(freqsNLsgmplus)

# sample small db and make all pairwise comparisons
db <- sample.profiles(N=10^3,freqs=freqsNLsgmplus)
ibs.pairwise.db(db)
}
\seealso{
\code{\link{as.dbcompare}}
}

