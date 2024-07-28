dir.create("neiss")

Sys.setenv(http_proxy="http://127.0.0.1:7890/")
Sys.getenv("http_proxy")


download <- function(name) {
  url <- "https://github.com/hadley/mastering-shiny/raw/main/neiss/"
  download.file(paste0(url, name), paste0("neiss/", name))
}



download("injuries.tsv.gz")
download("population.tsv")
download("products.tsv")
