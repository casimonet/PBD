\name{pbd_bootstrap}
\alias{pbd_bootstrap}
\title{Bootstrap analysis under protracted birth-death model of diversification}
\description{Likelihood maximization for protracted birth-death model of diversification followed by simulations of the model using the maximum
likelihood parameter estimates to compute an estimate of the error in these estimates and to assess the goodness-of-fit of the model by comparing
maximum likelihoods of the simulated data sets to the maximum likelihood of the real data set.}
\usage{
pbd_bootstrap(
   brts,
   initparsopt = c(0.2,0.1,1),
   idparsopt = 1:length(initparsopt),
   idparsfix = NULL,
   parsfix = NULL,
   exteq = (length(initparsopt) < 4),
   parsfunc = c(function(t,pars) {pars[1]},function(t,pars) {pars[2]},
function(t,pars) {pars[3]}, function(t,pars) {pars[4]}),
   missnumspec = 0,
   cond = 1,
   btorph = 0,
   soc = 2,
   plotltt = 1,
   methode = "lsoda",
   n_low = 0,
   n_up = 0,
   tol = c(1E-4, 1E-4, 1E-6),
   maxiter = 1000 * round((1.25)^length(idparsopt)),
   endmc = 100,
   seed = 42
)}
\arguments{
  \item{brts}{A set of branching times of a phylogeny, all positive }
  \item{initparsopt}{The initial values of the parameters that must be optimized}
  \item{idparsopt}{
   The ids of the parameters that must be optimized, e.g. 1:4 for all parameters.
   The ids are defined as follows: \cr
   id == 1 corresponds to b (speciation-initiation rate) \cr
   id == 2 corresponds to mu_1 (extinction rate of good species) \cr
   id == 3 corresponds to la_1 (speciation-completion rate) \cr
   id == 4 corresponds to mu_2 (extinction rate of incipient species) \cr
   }
  \item{idparsfix}{
The ids of the parameters that should not be optimized, e.g. c(2,4) if mu_1 and mu_2
should not be optimized, but only b and la_1. In that case idparsopt must be c(1,3).
  }
  \item{parsfix}{ The values of the parameters that should not be optimized }
  \item{exteq}{Sets whether incipient species have the same (1) or different (0) extinction rate as good species.
If exteq = 0, then idparsfix and idparsopt should together have all parameters 1:4
}
  \item{parsfunc}{ Specifies functions how the rates depend on time, default functions are constant functions }
  \item{missnumspec}{
The number of species that are in the clade but missing in the phylogeny }
  \item{cond}{Conditioning: \cr
    cond == 0 : conditioning on stem or crown age \cr
    cond == 1 : conditioning on stem or crown age and non-extinction of the phylogeny \cr
}
  \item{btorph}{Sets whether the likelihood is for the branching times (0) or the phylogeny (1)}
  \item{soc}{Sets whether the first element of the branching times is the stem (1) or the crown (2) age}
  \item{plotltt}{Sets whether the lineage-through-time plot should be plotted (1) or not (0) }
  \item{methode}{Sets which method should be used in the ode-solver. Default is 'lsoda'.
See package deSolve for details.}
  \item{n_low}{Sets the lower bound of the number of species on which conditioning should be done when cond = 2. Set this to 0 when conditioning should be done on precisely the number of species (default)}
  \item{n_up}{Sets the upper bound of the number of species on which conditioning should be done when cond = 2. Set this to 0 when conditioning should be done on precisely the number of species (default)}  
  \item{tol}{Sets the tolerances in the optimization. Consists of: \cr
   reltolx = relative tolerance of parameter values in optimization \cr
   reltolf = relative tolerance of function value in optimization \cr
   abstolx = absolute tolerance of parameter values in optimization
}
  \item{maxiter}{Sets the maximum number of iterations in the optimization}
  \item{endmc}{Sets the number of simulations for the bootstrap}
  \item{seed}{Sets the seed for the simulations of the bootstrap}
}
\value{A list of three dataframes. The first dataframe contains the maximum likelihood results of the real data set, the second contains the simulated trees, and the third dataframe, with number of rows equal to endmc, contain the maximum likelihood results for the simulated data. The columns of both frames contains the following elements for each simulated data set:
 \item{ntips}{ gives the number of tips }
 \item{b}{ gives the maximum likelihood estimate of b}
 \item{mu_1}{ gives the maximum likelihood estimate of mu_1}
 \item{la_1}{ gives the maximum likelihood estimate of la_1}
 \item{mu_2}{ gives the maximum likelihood estimate of mu_2}
 \item{loglik}{ gives the maximum loglikelihood}
 \item{df}{ gives the number of estimated parameters, i.e. degrees of feedom}
 \item{conv}{ gives a message on convergence of optimization; conv = 0 means convergence}
 \item{exp_durspec}{ gives the expected duration of speciation}
 \item{median_durspec}{ gives the median duration of speciation}
}
\author{
Rampal S. Etienne
}
\seealso{
 \code{\link{pbd_ML}}
}
\examples{
pbd_bootstrap(1:10,endmc = 2)
}
\keyword{ models }
