#
# Rock R Server Dockerfile with DataSHIELD Omics
#
# https://github.com/datashield/docker-rock-omics
#

FROM datashield/rock-base:latest

ENV DSOMICS_VERSION v1.0.7.9

ENV ROCK_LIB /var/lib/rock/R/library

# Install new R packages
# dsOmics
RUN Rscript -e "BiocManager::install(c('Biobase', 'SNPRelate', 'GENESIS', 'GWASTools', 'GenomicRanges', 'SummarizedExperiment', 'DESeq2', 'edgeR', 'MEAL'), update = FALSE, ask = FALSE, dependencies = TRUE, lib = '$ROCK_LIB')"
RUN Rscript -e "remotes::install_github('isglobal-brge/dsOmics', ref = '$DSOMICS_VERSION', dependencies = TRUE, upgrade = FALSE, lib = '$ROCK_LIB')"

RUN chown -R rock $ROCK_LIB
