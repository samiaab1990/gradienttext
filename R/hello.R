# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

make_gradient<-function(string_lab=NULL, colors=NULL)
{
  if (is.null(colors) | length(colors) <=1)
  {
    stop("Argument must be a vector of at least two colors.")
  }


  if(is.null(string_lab) | !is.character(string_lab))
  {
    stop("Function requires character string.")
  }


  pal = colorRampPalette(colors)

  lab = string_lab

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
