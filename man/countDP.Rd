% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/countDP.R
\name{countDP}
\alias{countDP}
\title{Differentially private count}
\usage{
countDP(input_data, epsilon)
}
\arguments{
\item{input_data}{the input vector}

\item{epsilon}{privacy budget}
}
\value{
a numeric, differentially private count of the number of elements in a vector
}
\description{
Computes a differentially private count of the number of elements in a vector
}
