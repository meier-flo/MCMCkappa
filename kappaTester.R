dummyDataGenerator<-function(snippetsCount,coderCount,codesCount,agree){
  snippet<-sort(rep(1:snippetsCount,(coderCount*codesCount)),decreasing = FALSE)
  coder<-rep(sort(rep(1:coderCount,codesCount),decreasing=FALSE),snippetsCount)
  code<-rep(LETTERS[seq(from=1,to=codesCount)],(coderCount*snippetsCount))
    
  if(agree==1){
  value<-rep(1:1,(snippetsCount*coderCount*codesCount))
  }else if(agree==0){
  value<-sample(0:1,replace=T,(snippetsCount*coderCount*codesCount))
  }
  dummyData<-data.frame(snippet,coder,code,value,stringsAsFactors = FALSE)
  return(dummyData)
}


