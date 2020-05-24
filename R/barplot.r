#' Exports a barplot 
#'
#' This function exports a dataset into a barplot based on user-specified settings. It assumes 
#' that the xaxis, yaxis, and groupby are all fields within the dataset. The following fields 
#' are required to be set as opts in opt: xaxis, yaxis, digits, groupby, outfile
#'
#' @param data The dataset to use in the graph
#' @return The original dataset (unmodified)
#' @export
export_barplot <- function (data, opt) {
  orig_groupby_col <- data[,opt$groupby] 
  gbsym <- rlang::sym(opt$groupby)
  data %>%
    #mutate(!!opt$groupby := factor(rlang::UQ(rlang::sym(opt$groupby)))) %>%
    mutate(!!gbsym := factor(!!gbsym)) %>%
    ggbarplot(opt$xaxis, opt$yaxis, label=TRUE, lab.nb.digits=opt$digits,
              fill=opt$groupby, color=opt$groupby, palette='Paired',
              position=position_dodge(0.8),add='mean_se') %>%
    ggarrange() %>%
    ggexport(filename=opt$outfile)

  data[,opt$groupby] <- orig_groupby_col
  data
}
