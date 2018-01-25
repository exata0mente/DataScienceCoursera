locate_info_repo <- function(url, search_field, search_data, return_info){

# Este script corresponde ao exercício 1 da semana 2 do curso Getting and Cleanning Data, 
# no qual é proposto apartir de uma url de repositório do nosso instrutor, localizar e 
# coletar o dado (return_info) informando o campo (search_field) e o dado (search_data).
# 
# Por exemplo: Coletar a data de criação do repositório de nome datasharing.
  
# url="https://api.github.com/users/jtleek/repos"
# search_field="name"
# search_data="datasharing"
# return_info="created_at"

  require(httr)
  require(jsonlite)

  
  data_url_api <- GET(url)
  content_url_api <- content(data_url_api)
  i <- NULL
  
  dataJSON <- fromJSON(toJSON(content_url_api))


  for(repositories in 1:nrow(dataJSON))
    if(dataJSON[repositories,search_field]==search_data)
      i <- repositories
  if(is.null(i))
    stop("Deu ruim")
      
   dataJSON[i,return_info]

}
