# Sea Ice Reporting

### Introduction

This project seeks to analyze how sea ice is discussed and framed in Alaskan news reporting (specifically looking within the Alaska Dispatch News). It utilizes a corpus-based approach to identify collocations, co-occurrences, LDA topic models, and relevant derived metrics from these analyses. Many of the quantitative methods follow the tutorial written by Andreas Niekley and Gregor Wiedemann at https://tm4ss.github.io/docs/index.html.

For more information on this project, please contact Kelly Claborn at kelly.claborn@asu.edu.


### Getting Started

Within the "code" folder, you will find all necessary R scripts to run the quantitative analyses used in this study. Please note that all scripts in this repository are set up to specifically run analysis for corpus documents between the years 1995-2021, and use the focal term "sea ice". If you end up using a different corpus, some of the data cleaning, stop words, lemmatized words, and other study-specific parameters (such as plot titles, etc.) will need to be adjusted for your own needs.

#### Script Roadmap

- **corpusPreProcess.R:** Can be used to convert PDF files straight from the NexisUni news database into text files. It creates two directories called data/corpus/pre-processed and data/corpus/post-processed. If you are seeking to replicate our specific analysis with Alaska Dispatch News articles from years 1995 - October 1 2021 (with duplicates already semi-automatically removed), then you may instead contact kelly.claborn@asu.edu for access to the data/corpus/post-processed folder.

- **metadataExtract.R:** Pulls in the post-processed data and cleans and wrangles it using common stopword and lemma files, preparing the data frame that will be sourced for the rest of the analysis.

- **"analysis" folder:** Contains all necessary scripts for three separate analyses. wordCountCollocations.R will provide descriptive statistics on the number of documents per year, most frequent bigrams, most frequent "sea ice" trigrams, and associated figures. CooccurrenceAnalysis.R will conduct a broader co-occurrence analysis, pulling in single tokenized words as well as the most frequent collocations. It will produce networks of these models, centered on the focal term "sea ice". topicModel.R will run an LDA model across the entire corpus and output relevant posterior probabilities for each topic (example outputs are included in data/exampleOutput/topicmodel/20220409 to aid in replicability of this specific study). topicModelViz.R produces word clouds and other relevant figures using the topic model output.

- **"functions" folder:** Contains relevant sourced functions for the co-occurrence analysis, plotting, and a semi-automated checking of duplicates procedure that was used in te data pre-processing phase. calculateCoocStatistics.R and calculateLogLikelihood.R are both sourced in CooccurrenceAnalysis.R. plotThemes.R is sourced in wordCountsCollocations.R and topicModelViz.R. checkDuplicates.R pulls in data outputs from strDist_forDuplicates.jl to manually check the string distances across the potentially duplicated articles. When there is a potential duplicate, manual examination of the articles must take place (only those listed as "FINAL EDITION" are kept -- though, there are some instances where there are re-runs of the same article, years apart). NOTE:  the input data for the strDist Julia function script must be requested (at kelly.claborn@asu.edu).