#' Automatically detect and change excel gene conversion
#'
#' @description
#'This function will search through the indicated column for errors in auto-conversion
#'caused by Excel and automatically modify the gene back to the gene symbol.
#'
#'
#' @param data The data frame with genetic information, can be expression or differential analysis.
#' @param gene.Column The header for the column where the genes are located, leave as NULL if genes are row names.
#' @param mouse Boolean. If data is of mouse gene symbols put TRUE.
#'
#' @return data frame
#' @export



exTerminate <- function(data, gene.Column = NULL, mouse = FALSE) {
  if (mouse) {
    reference <- reference_MM
  } else {
    reference <- reference_HS
  }
  if (is.null(gene.Column)) {
    if (all(is.numeric(data[,1][!is.na(data[,1])]))) {
      for (i in seq_len(nrow(reference))) {
        rownames(data) <- gsub(reference$Exc_Genes[i], reference$Gene_Symbol[i], rownames(data))
      }
    } else {
      for (i in seq_len(nrow(reference))) {
        data[,1] <- gsub(reference$Exc_Genes[i], reference$Gene_Symbol[i], data[,1])
      }
    }
  } else {
    for (i in seq_len(nrow(reference))) {
      data[,gene.Column] <- gsub(reference$Exc_Genes[i], reference$Gene_Symbol[i], data[,gene.Column])
    }
  }
  return(data)
}



