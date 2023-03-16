\name{IlluminaHumanMethylationEPICv2manifest}
\alias{IlluminaHumanMethylationEPICv2manifest}
\docType{data}
\title{
  Manifest object for the IlluminaHumanMethylationEPIC v2.0 array
}
\description{
  This object contains the array design for Illumina's Human Methylation
  EPIC v2.0 microarray. 
}
\usage{data(IlluminaHumanMethylationEPICv2manifest)}
\details{
  This package is based on the file \url{https://support.illumina.com/content/dam/illumina-support/documents/downloads/productfiles/methylationepic/MethylationEPIC\%20v2\%20Files.zip} from 
  \url{https://support.illumina.com/array/array_kits/infinium-methylationepic-beadchip-kit/downloads.html}.

  A script for creating the data object in this package is contained in
  \code{system.files("scripts", "manifest.R", package = "IlluminaHumanMethylationEPICv2manifest")}, which is slightly adjusted from the 
  script in the "IlluminaHumanMethylationEPICmanifest" package.
}
\format{
  An object of class \code{IlluminaMethylationManifest}
}
\references{
  None.
}
\seealso{
  The description of the class in the minfi package,
  \code{\link[minfi]{IlluminaMethylationManifest-class}}.
}
\examples{
IlluminaHumanMethylationEPICv2manifest
}
\keyword{datasets}
