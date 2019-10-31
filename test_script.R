library(devtools)
install_github("kbolab/moddicom")

#Use case 1: Extract features from a single patient DICOM series

library(moddicom)
obj.geolet <- geoLet()
obj.geolet$openDICOMFolder(pathToOpen= "./test/Images/PAT1")
obj.geolet$getROIList()
roi <- "GTV-1"
roiVoxels <- obj.geolet$getROIVoxels(Structure = roi)
GTV_voxelcube <- roiVoxels$masked.images$voxelCube
image(GTV_voxelcube[,,6], col = grey.colors(256))
features <- computeFeatures.geoLet(obj.geoLet = obj.geolet, ROIName = roi, feature.family=c("stat","morph","glcm","rlm","szm"),discretize = "bin.number")

#Use case 2: Extract features from multiple patients DICOM series

library(moddicom)
path <- "./test/Images"
roi <- "GTV-1"
features <- f.extractor.sing.par(path = path, ROIName = roi, feature.family=c("stat","morph","glcm","rlm","szm"))


#Use case 3: Extract features from multiple patients DICOM series with LoG filter

library(moddicom)
path <- "./test/Images"
roi <- "GTV-1"
features <- f.extractor.pluri.LoG.par(path = path, ROIName = roi, from.sigma = 0.6, to.sigma = 1.0, def.by =  0.2, feature.family=c("stat","morph","glcm","rlm","szm"))



