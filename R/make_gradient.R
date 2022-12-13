#' Make Gradient
#'
#' @description 'This function takes a string label and a vector of at least two colors as an argument and applies gradient colors to the text. The function must be used with either geom_richtext, geom_textbox, element_markdown or element_textbox functions from ggtext.
#' @param label, an input that can be character, numeric or factor to which the gradient colors will be applied to after coerced into a character string
#' @param colors character(...) string, a vector of at least two characters representing valid color names or hex codes,uses linear interpolation to create gradient color scheme
#'
#' @importFrom grDevices colorRampPalette
#' @return make_lab, the text label with html span tags that apply the gradient color scheme specified in the colors argument
#' @export
make_gradient<-function(label=NULL, colors=NULL)
{
  if (is.null(colors) | length(colors) <=1)
  {
    stop("Argument must be a vector of at least two colors.")
  }


  if (is.null(label))
  {
    stop("Function requires label.")
  }


  if (is.factor(label))
  {
      lab_list<-list()

      for(i in label)
      {
        lab_list <-append(lab_list, make_gradient(i, colors=colors))
      }

      make_lab<-unlist(lab_list)

      return(make_lab)

  }


  lab = as.character(label)

  lab_nospace = gsub(" ","",lab)

  pal = colorRampPalette(colors)

  pal_n<-pal(nchar(lab_nospace))

  make_lab<-""

  j = 0

  for(i in 1:nchar(lab))
  {


    if (substr(lab,i,i) !=" ")
    {
      j = j + 1
      make_lab = paste0(make_lab,"<span style='color:",pal_n[j],";'>",substr(lab,i,i),"</span>")
    }

    else
    {
      make_lab<-paste0(make_lab," ")
    }
  }
  return(make_lab)
}



