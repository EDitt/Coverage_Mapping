# Coverage_Mapping

## Using barley exome capture data

### 1. Bedtools
-I used the bedtools hist output data from the sequence handling pipeline to graph coverage for the 24 samples\
  -The -hist option outputs a histogram of coverage for each feature in the BED file as well as a summary histogram for all of the features in the BED file.\
-Code to graph coverage was adapted from Stephen Turner's blog: http://www.gettinggeneticsdone.com/2014/03/visualize-coverage-exome-targeted-ngs-bedtools.html \
  -Piped the output of bedtools to grep out only the lines starting with "all" \
  -Plots the cumulative distribution describing the fraction of targeted bases that were covered by >10 reads, >20 reads, >80 reads, etc.\
  -Depth on the x axis, and the fraction of capture target bases >/= depth on y-axis \
-Coverage looks low, but Bedtools cannot map coverage on very large chromosomes. Therefore used Bedops to look at coverage

### 2. Bedops

-Bedops needs bed files as input, but has a built-in command that converts bam files to bed files (`bam2bed`). (It will also convert other file formats)\
  -In addition to bedops, this command relies on the samtools module\
-From manual (6.2.1.3.3.2. Element and overlap statistics): The bedmap program takes in 'reference' and 'mapping' files and calculates statistics for each reference element. If the echo option is used, the result will be at least a 3-column BED file.\
  -the `--count` flag counts the number of elements in the 'map' that overlaps a given 'reference' element and the `--bases` flag reports the extent of overlap as measured by the total number of overlapping bases from mapped elements\
  -Can also use the `--bases-uniq-f` flag to report the fraction of total bases within the reference which are covered by overlapping elements in 'map'
