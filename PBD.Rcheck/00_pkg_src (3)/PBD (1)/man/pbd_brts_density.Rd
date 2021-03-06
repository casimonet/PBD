\name{pbd_brts_density}
\alias{pbd_brts_density}
\title{Node depth probbaility density for protracted birth-death model of diversification}
\description{
pbd_brts_density computes the probability density of node depths under the protracted speciation model given a set of parameters
}
\usage{
pbd_brts_density(
    pars1,
    pars1f = c(function(t,pars) {pars[1]},function(t,pars) {pars[2]},
function(t,pars) {pars[3]}, function(t,pars) {pars[4]}),
    methode = "lsoda",
    brts
)}
\arguments{
  \item{pars1}{Vector of parameters: \cr \cr
    \code{pars1[1]} corresponds to b (= la_1 in Etienne & Rosindell R2012) = speciation initiation rate \cr
    \code{pars1[2]} corresponds to mu_1 (= mu_g in Etienne & Rosindell 2012) = extinction rate of good species \cr
    \code{pars1[3]} corresponds to la_1 (= la_2 in Etienne & Rosindell 2012) = speciation completion rate \cr
    \code{pars1[4]} corresponds to mu_2 (= mu_i in ER2012) = extinction rate of incipient species \cr
When rates depend on time this time dependence should be specified in pars1f and pars1 then becomes the parameters used in pars1f \cr \cr
}
 \item{pars1f}{Vector of functions how the rates depend on time, default functions are constant functions of the parameters in pars1: \cr \cr
    \code{pars1f[1]} corresponds to time-dependence of b (= la_1 in Etienne & Rosindell R2012) = speciation initiation rate \cr
    \code{pars1f[2]} corresponds to time-dependence of mu_1 (= mu_g in Etienne & Rosindell 2012) = extinction rate of good species \cr
    \code{pars1f[3]} corresponds to tiem-dependence of la_1 (= la_2 in Etienne & Rosindell 2012) = speciation completion rate \cr
    \code{pars1f[4]} corresponds to time-dependence of mu_2 (= mu_i in ER2012) = extinction rate of incipient species \cr \cr
}
  \item{methode}{ sets which method should be used in the ode-solver. Default is 'lsoda'. See package deSolve for details. \cr \cr
}
  \item{brts}{A set of branching times of a phylogeny, all positive, for which the density must be computed }
}
\value{The probability density for all branching times}
\author{ Rampal S. Etienne }
\seealso{
 \code{\link{pbd_ML}}
}
\examples{ pbd_brts_density(pars1 = c(0.2,0.1,1,0.1), methode = "lsoda",brts = 1:10) }
\keyword{ models }