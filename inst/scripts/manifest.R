library(minfi)

## Needs to be uncompressed
manifestFile <- "~/Downloads/MethylationEPIC_v2.0_Files/EPIC-8v2-0_A1.csv"
stopifnot(file.exists(manifestFile))
maniTmp <- minfi:::read.manifest.EPIC(manifestFile)

## Checking
manifest <- maniTmp$manifest
address.all <- c(manifest$AddressA, manifest$AddressB)
sum(address.all == "")
sum(is.na(address.all))
address.all <- address.all[address.all != ""]
length(address.all)
stopifnot(!anyDuplicated(address.all))
library(illuminaio)
epic <- readIDAT("/Users/guz/workspace/hirschsprung_multiomics/207057140007_R01C01_Grn.idat")
address.epic <- as.character(epic$MidBlock)
sum(!address.epic %in% address.all) ## Set of addresses in the IDAT file not part of the manifest
sum(! address.all %in% address.epic) ## set of addresses not in IDAT file.
nrow(manifest)
any(manifest$AddressA != "" & !manifest$AddressA %in% address.epic)
any(manifest$AddressB != "" & !manifest$AddressB %in% address.epic)
wh <- which(manifest$AddressB != "" & !manifest$AddressB %in% address.epic)
tmp <- manifest[wh,]
table(tmp$Infinium_Design_Type)
table(tmp$Color_Channel)
table(tmp$Methyl450_Loci)

## Controls ok
all(maniTmp$controls[,1] %in% address.epic)

## Manifest package
maniList <- maniTmp$manifestList
## Manually removing 1031 CpGs with missing addresses
## dropCpGs <- manifest$Name[manifest$AddressB != "" & !manifest$AddressB %in% address.epic]
## table(substr(dropCpGs, 1,2))
## maniList$TypeI <- maniList$TypeI[! maniList$TypeI$Name %in% dropCpGs,]

IlluminaHumanMethylationEPICv2manifest <- IlluminaMethylationManifest(TypeI = maniList$TypeI,
                                                                    TypeII = maniList$TypeII,
                                                                    TypeControl = maniList$TypeControl,
                                                                    TypeSnpI = maniList$TypeSnpI,
                                                                    TypeSnpII = maniList$TypeSnpII,
                                                                    annotation = "IlluminaHumanMethylationEPICv2")
stopifnot(validObject(IlluminaHumanMethylationEPICv2manifest))
save(IlluminaHumanMethylationEPICv2manifest, compress = "xz",
     file = "/Users/guz/workspace/hirschsprung_multiomics/IlluminaHumanMethylationEPICv2manifest/data/IlluminaHumanMethylationEPICv2manifest.rda")
sessionInfo()

