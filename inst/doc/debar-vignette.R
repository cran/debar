## ----loadlib, echo = TRUE, results = 'hide', message=FALSE, warning=FALSE----
library(debar)

## ------------------------------------------------------------------------
ex_out = denoise_list(ex_nt_list)

## ---- eval=FALSE---------------------------------------------------------
#  ex_out = denoise_list(ex_nt_list, cores = 4)

## ------------------------------------------------------------------------
barcode_out = consensus_sequence(ex_out)

## ------------------------------------------------------------------------
#The following example file is used as an input in the vignette
fastq_example_file = system.file('extdata/coi_sequel_data_subset.fastq.gz', package = 'debar')

#other example data also available in debar:
#fastq_example_file = system.file('extdata/coi_sequel_data_subset.fastq', package = 'debar')
#fasta_example_file = system.file('extdata/coi_sequel_data_subset.fasta', package = 'debar')

## ---- eval = FALSE-------------------------------------------------------
#  # NOTE - this block of code is not run so as to avoid the generation of output files!
#  #
#  # Our input file with noisy sequence data is fastq_example_file.
#  # Output file is "example_output.fastq"
#  # If you do wish to run these examples, then please double check your working directory!
#  denoise_file(fastq_example_file, filename = "example_output.fastq")
#  
#  denoise_file(fastq_example_file, filename = "multicore-example_output.fastq", multicore = 8, log_file = TRUE, keep_rejects = TRUE)
#  

