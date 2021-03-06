#' Select features based on variance threshold
#'
#' @description Find out about the variance of each feature and
#' filter out the ones below a certain threshold
#'
#' @param data tibble. The features to select from
#' @param threshold double. The variance threshold
#'
#' @return double vector. The indexes of selected features
#' @export
#' @examples
#' data <- data.frame(x1=c(1,2,3,4,5), x2=c(0,0,0,0,0), x3=c(1,1,1,1,1))
#' variance_thresholding(data)
#' # [1] 1
variance_thresholding <- function(data, threshold = 0) {
  if (!any(class(data) == "data.frame")) {
    stop("Expected a `data.frame` object for `data`.")
  }

  if (threshold < 0 | !is.numeric(threshold)) {
    stop("Threshold must be a positive number.")
  }

  selected_feature_indexes <- c()
  for (i in 1:length(names(data))) {
    # Get variance of a column
    var_i <- stats::var(data[,i])

    if (var_i > threshold) {
      # Add the column to the selected pile if
      # its variance is above the threshold
      selected_feature_indexes <- c(selected_feature_indexes, i)
    }
  }

  selected_feature_indexes
}
