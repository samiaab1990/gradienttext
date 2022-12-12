#' Make Gradient
#'
#' @description 'This function takes a string label and a vector of at least two colors as an argument and applies gradient colors to the text. The function must be used with either geom_richtext, geom_textbox, element_markdown or element_textbox functions from ggtext.
#' @param string_lab character(1) string, a text label to which the gradient colors will be applied to
#' @param colors character(...) string, a vector of at least two characters representing valid color names or hex codes,uses linear interpolation to create gradient color scheme
#'
#' @importFrom grDevices colorRampPalette
#' @return make_lab, the text label with html span tags that apply the gradient color scheme specified in the colors argument
#' @export
make_gradient<-function(string_lab=NULL, colors=NULL)
{
  if (is.null(colors) | length(colors) <=1)
  {
    stop("Argument must be a vector of at least two colors.")
  }


  if (is.null(string_lab))
  {
    stop("Function requires label.")
  }


  if (is.factor(string_lab))
  {
      lab_list<-list()

      for(i in string_lab)
      {
        lab_list <-append(lab_list, make_gradient(i, colors=colors))
      }

      make_lab<-unlist(lab_list)

      return(make_lab)

  }


  lab = as.character(string_lab)

  pal = colorRampPalette(colors)

  pal_n<-pal(nchar(lab))

  make_lab<-""

  for(i in 1:nchar(lab))
  {
    j = i

    if (substr(lab,i,i) !=" ")
    {
      make_lab = paste0(make_lab,"<span style='color:",pal_n[j],";'>",substr(lab,i,i),"</span>")
    } else
    {
      make_lab<-paste0(make_lab," ")
      j = i - 1
    }

  }
  return(make_lab)
}



