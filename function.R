#' Automatically detect and change excel gene conversion
#'
#'This function will search through the indicated column for errors in auto-conversion
#'caused by Excel and automatically modify the gene back to the gene symbol. As of now
#'this function only works for Human genes.
#'
#'
#' @param data The data frame with genetic information, can be expession or differential analysis.
#' @param gene.Column The header for the column where the genes are located, leave as NULL if genes are row names. 




exTerminate <- function(data, gene.Column = NULL) {
    reference <- get("reference")
    if (is.null(gene.Column)) {
        for (i in seq_len(nrow(reference))) {
            rownames(data) <- gsub(reference$Exc_Genes[i], reference$Gene_Symbol, rownames(data))
        }
    } else {
    for (i in seq_len(nrow(reference))) {
        data[,gene.Column] <- gsub(reference$Exc_Genes[i], reference$Gene_Symbol, data[,gene.Column])
        }
    }
}