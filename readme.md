IlluminaHumanMethylationEPICv2manifest
--------------------------------------


This package provides manifest for Illumina methylation EPIC array v2.0. The data is based on the file https://support.illumina.com/content/dam/illumina-support/documents/downloads/productfiles/methylationepic/MethylationEPIC%20v2%20Files.zip from 
  https://support.illumina.com/array/array_kits/infinium-methylationepic-beadchip-kit/downloads.html.

A script for creating the data object in this package is contained in
  `system.files("scripts", "manifest.R", package = "IlluminaHumanMethylationEPICv2manifest")`, 
which is slightly adjusted from the original script in the **IlluminaHumanMethylationEPICmanifest** package.


When using with the **minfi** package, you can manually set the "array" element by providing the prefix (removing the string "manifest"):

```r
RGset = read.metharray.exp(...)

annotation(RGset)["array"] = "IlluminaHumanMethylationEPICv2"

# explained in the IlluminaHumanMethylationEPICv2anno.20a1.hg38 package
annotation(RGset)["annotation"] = "20a1.hg38"
```
