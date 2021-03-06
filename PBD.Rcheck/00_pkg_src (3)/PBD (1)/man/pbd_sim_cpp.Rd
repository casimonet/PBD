\name{pbd_sim_cpp}
\alias{pbd_sim_cpp}
\title{ Function to simulate the approximate protracted speciation process }
\description{ Simulating the protracted speciation process according to the approxiomate model of Lambert et al. 2014.
This function differs from pbd_sim that 1) it requires that the speciation-initiation
rate is the same for good and incipient species, and 2) that it does not simulate the exact protracted
speciation process, but an approximation made by the coalescent point process. }
\usage{ pbd_sim_cpp(
  pars,
  parsf = c(function(t,pars) {pars[1]},function(t,pars) {pars[2]},
function(t,pars) {pars[3]},function(t,pars) {pars[4]}),
  age,
  soc = 2,
  plotltt = 1,
  methode = "lsoda"
)}
\arguments{
  \item{pars}{Vector of parameters: \cr \cr
    \code{pars[1]} corresponds to b (= la_1 in Etienne & Rosindell R2012) = speciation initiation rate \cr
    \code{pars[2]} corresponds to mu_1 (= mu_g in Etienne & Rosindell 2012) = extinction rate of good species \cr
    \code{pars[3]} corresponds to la_1 (= la_2 in Etienne & Rosindell 2012) = speciation completion rate \cr
    \code{pars[4]} corresponds to mu_2 (= mu_i in ER2012) = extinction rate of incipient species \cr
When rates depend on time this time dependence should be specified in pars1f and pars1 then becomes the parameters used in pars1f \cr \cr
}
 \item{parsf}{Vector of functions how the rates depend on time, default functions are constant functions of the parameters in pars1: \cr \cr
    \code{parsf[1]} corresponds to time-dependence of b (= la_1 in Etienne & Rosindell R2012) = speciation initiation rate \cr
    \code{parsf[2]} corresponds to time-dependence of mu_1 (= mu_g in Etienne & Rosindell 2012) = extinction rate of good species \cr
    \code{parsf[3]} corresponds to tiem-dependence of la_1 (= la_2 in Etienne & Rosindell 2012) = speciation completion rate \cr
    \code{parsf[4]} corresponds to time-dependence of mu_2 (= mu_i in ER2012) = extinction rate of incipient species \cr \cr
}
  \item{age}{ Sets the crown age for the simulation }
  \item{soc}{ Determines whether the simulation should start at stem (1) or crown (2) age }
  \item{plotltt}{Sets whether the lineage-through-time plot should be plotted (1) or not (0) }
  \item{methode}{Sets which method should be used in the ode-solver. Default is 'lsoda'.
See package deSolve for details.}
}
\value{ A set of branching times }
\author{ Rampal S. Etienne }
\seealso{
 \code{\link{pbd_sim}}
}
\examples{ pbd_sim_cpp(pars = c(0.2,1,0.2,0.1),age = 15) }
\keyword{models}
