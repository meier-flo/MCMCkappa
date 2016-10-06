mcmcKappa<-function(data,coder,snippets,codelist){
  coder<-c(1:coder)
  snippets<-c(1:snippets)
  codelist<-codelist
  
}

kappaDataCleaner<-function(data){
  require(dplyr)
  require(tidyr)
  #### before we continue with ICC we have to complete the data
  # we expect data to be in a form like this 
  # snippet | coder | code 
  # 1       | 1     | A,B
  #
  # we have to make data long and add a value column with 1's
  data<-data%>%separate_rows(code,sep="\\,")
  value<-rep(1,nrow(data))
  data<-cbind(data,value=value)
  
  # we can use tidyr::complete to add the "missing" values
  # note that problems can occur if a code isn't used at all
  
  data<-data%>%complete(textsnippet,coder,code)
  data[is.na(data)]<-0
  
  return(data)
}