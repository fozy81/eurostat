#' @title Order of Variable Levels from Eurostat Dictionary.
#' @description Orders the factor levels.
#' @details Some variables, like classifications, have logical or conventional ordering. Eurostat data tables are nor neccessary ordered in this order. The function \code{dic_order} get the ordering from Eurostat classifications dictionaries. The function \code{\link{label_eurostat}} can also order factor levels of labels with argument \code{eu_order = TRUE}.
#' 
#' @param x a variable (code or labelled) to get order for.
#' @param dic a name of the dictionary. Correspond a variable name in the 
#'    data_frame from \code{\link{get_eurostat}}. Can be also data_frame from
#'    \code{\link{get_eurostat_dic}}.
#' @param type a type of the x. Could be \code{code} or \code{label}.
#' @export
#' @author Przemyslaw Biecek, Leo Lahti, Janne Huovari and Markus Kainu
#' @return A numeric vector of orders.
dic_order <- function(x, dic, type) {
  if (!is_tibble(dic)) dic <- get_eurostat_dic(dic)
  
  # code or label
  n_type <- match(type, c("code", "label"))
  if (is.na(n_type)) stop("Invalid type.")
  
  # get order
  y <- order(match(x, dic[[n_type]]))
  if (any(is.na(y))) stop("All orders were not found.")
  y
}
