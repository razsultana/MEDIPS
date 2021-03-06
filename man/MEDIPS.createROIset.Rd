\name{MEDIPS.createROIset}
\alias{MEDIPS.createROIset}
\alias{bin.ROIs}
\title{
Creates a MEDIPS ROI SET by reading a suitable input file
}
\description{
Reads the input file and calculates the short read coverage (counts) for the specified regions of interest(ROI).
After reading of the input file, the MEDIPS ROI SET contains information about the input file name, 
the dependent organism, the chromosomes included in the input file, the length of the included chromosomes (automatically loaded), the number of regions, and a GRange object of the ROIs. 
}
\usage{
MEDIPS.createROIset(file=NULL, ROI=NULL, extend=0, shift=0, bn=1, BSgenome=NULL, uniq=1e-3, chr.select=NULL, paired = F, sample_name=NULL, isSecondaryAlignment=FALSE, simpleCigar=TRUE)
}
\arguments{
   \item{file}{
Path and file name of the input data
}
   \item{ROI}{
Data.frame with columns "chr", "start", "end" and "name" of regions of interest
}
  \item{extend}{
defines the number of bases by which the region will be extended before the genome vector is calculated.
Regions will be extended along the plus or the minus strand as defined by their provided strand information.
}
\item{shift}{
As an alternative to the extend parameter, the shift parameter can be specified. Here, the reads are not extended but shifted by the specified number of nucleotides with respect to the given strand infomation.
One of the two parameters extend or shift has to be 0. 
}
\item{bn}{
Number of bins per ROI
}
  \item{BSgenome}{
The reference genome name as defined by BSgenome 
}
\item{uniq}{
The uniq parameter determines, if all reads mapping to exactly the same genomic position should be kept (uniq = 0), replaced by only one representative (uniq = 1), or if the number of stacked reads should be capped by a maximal number of stacked reads per genomic position determined by a poisson distribution of stacked reads genome wide and by a given p-value (1 > uniq > 0) (deafult: 1e-3). The smaller the p-value, the more reads at the same genomic position are potentially allowed.
}
\item{chr.select}{
only data at the specified chromosomes will be processed.
}
\item{paired}{
option for paired end reads
}
\item{sample_name}{
name of the sample to be stored with the MEDIPSROI SET.
}
\item{isSecondaryAlignment}{
option to import only primary alignments.
}
\item{simpleCigar}{
option to import only alignments with simple Cigar string.
}
}
\value{
An object of class MEDIPSroiSet.
}
\author{
Lukas Chavez and Matthias Lienhard
}
\examples{

library("BSgenome.Hsapiens.UCSC.hg19")
bam.file.hESCs.Rep1.MeDIP = system.file("extdata", "hESCs.MeDIP.Rep1.chr22.bam", package="MEDIPSData")
rois=data.frame(chr=c("chr22","chr22"), start=c(19136001, 19753401), stop=c(19136200, 19753500), ID=c("ID_1", "ID_2"))
MSet=MEDIPS.createROIset(file=bam.file.hESCs.Rep1.MeDIP,ROI=rois, BSgenome="BSgenome.Hsapiens.UCSC.hg19", extend=250, shift=0, uniq=1e-3)
}
