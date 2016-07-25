# K-means
kmeans.kernel = function(data, k){
  # data : data to be clusterd
  # k : num of clusters
  num = 0
  sse =0
  nlen = nrow(data)
  newcenter = data[sample(nlen, k), ]
  center = 0 * newcenter
  while((num<1000) & !(identical(center, newcenter))){
    center = newcenter; num = num + 1
    distance = apply(data, 1, function(x) apply(center, 1, function(y) sum((x-y)^2)))
    
    cluster = apply(distance, 2, which.min)
    for (j in 1:k){
      newcenter[j,] = colMeans(data[(cluster==j),])
    }
    sse[num] = sum(sapply(1:nlen, function(x) distance[cluster[x],x])^2)
  }
  plot(1:num,sse,'l')
  dataEllipse(data,groups=factor(cluster), levels=c(0.001))
  a = 0
  for (num in 1:nlen){
    a = a + distance[cluster[num], num]
  }
  return(list("distance" = a, "c" = cluster, "center" = center))
}

kmeans = function(data, k, r){
  # data : data to be clusterd
  # k : num of clusters
  # r : num of different randomly chosen initializations
  dis = -1; 
  cluster = 0;
  center = 0;
  for (i in 1:r){
    res = kmeans.kernel(data, k)
    if((dis == -1) | (res$distance < dis)){
      dis = res$distance
      cluster = res$c
      center = res$center
    }
  }
  
  return(list("center" = center, "cluster" = cluster))
}
