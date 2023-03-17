
.onLoad = function(libname, pkgname) {

    data("IlluminaHumanMethylationEPICv2manifest", package = pkgname, lib.loc = libname)
    ns = asNamespace(pkgname)
    assign("IlluminaHumanMethylationEPICv2manifest", IlluminaHumanMethylationEPICv2manifest, envir = ns)
    namespaceExport(ns, "IlluminaHumanMethylationEPICv2manifest")
}

