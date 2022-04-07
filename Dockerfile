#
# Rock R Server Dockerfile with DataSHIELD Omics
#
# https://github.com/obiba/docker-rock-omics
#

FROM datashield/rock-base:latest

ENV DSOMICS_VERSION 1.0.8

ENV ROCK_LIB /var/lib/rock/R/library

# Install new R packages
# dsOmics
RUN Rscript -e "BiocManager::install(c('Biobase', 'SNPRelate', 'GENESIS', 'GWASTools', 'GenomicRanges', 'SummarizedExperiment', 'DESeq2', 'edgeR', 'MEAL'), update = FALSE, ask = FALSE, lib = '$ROCK_LIB')"
RUN Rscript -e "remotes::install_github('isglobal-brge/dsOmics', ref = '$DSOMICS_VERSION', upgrade = FALSE, lib = '$ROCK_LIB')"

RUN chown -R rock $ROCK_LIB
