## ----loadlib, echo = TRUE, results = 'hide', message=FALSE, warning=FALSE----
library(debar)

## ------------------------------------------------------------------------
fastq_example_file = system.file('extdata/coi_sequel_data_subset.fastq.gz', package = 'debar')
data = read_fastq(fastq_example_file)
names(data)
#head(data) - to view the first few records

## ------------------------------------------------------------------------
i = 33 #the row number from the example dataframe to be analyzed in the single sequence demonstration
ex = DNAseq(data$sequence[[i]], name = data$header_data[[i]], phred = data$quality[[i]])
ex #

## ------------------------------------------------------------------------
ex$name
#can always check to see the available components with the names function
print("Available in the current DNAseq object:")
names(ex)

## ------------------------------------------------------------------------
ex = frame(ex)

## ------------------------------------------------------------------------
ex = adjust(ex, censor_length = 4)

## ------------------------------------------------------------------------
ex$adjustment_count

## ------------------------------------------------------------------------
ex$adjusted_sequence[150:164]

## ------------------------------------------------------------------------
ex = aa_check(ex) #the default behaviour should suit >99% of user's needs
  

## ------------------------------------------------------------------------
#option a - reattach the flanking sequence - use this if you wish to preserve sequence tags
ex = outseq(ex) 
ex$outseq
nchar(ex$outseq) # the flanking sequence is reattached
ex$outphred

## ------------------------------------------------------------------------
#option b - output only the sequence for the COI-5P region
ex = outseq(ex, keep_flanks = FALSE) 
ex$outseq #placeholder characters added to the front of the sequence to establish common reading frame when necessary
nchar(ex$outseq) # only the COI-5P region is outout


## ---- eval = FALSE-------------------------------------------------------
#  # note - the out demonstration markdown cells are set to eval = FALSE so that output files are not generated
#  # and saved without you reading this message and doing it on purpose. Make sure to check your working directory first!
#  
#  write_fasta(ex, filename = "out.fa" , append = TRUE) #will append ex's output sequence to out.fa
#  
#  write_fasta(ex, filename = "out.fa" , append = FALSE) #will overwrite out.fa with the data for ex.

## ------------------------------------------------------------------------
write_fastq(ex, filename = "out.fq") # default - appends output sequence to the file and keeps the objects phred scores

write_fastq(ex, filename = "out.fq" , append = FALSE, keep_phred = FALSE, phred_placeholder = "?") #alternative - overwrites 
# file and discards the phred scores, replacing them with the character "?" the correct number of times.

