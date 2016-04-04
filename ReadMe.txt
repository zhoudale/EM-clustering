
1. Run the script from top to bottom in R

2.  K-mean: type “kmeans(data, k, r)”to run k-means. The output is the center and cluster of the k-means clusters. E.g. test = kmeans(data1,2,1)

3. EM: type “EM(data, k, epsilon, nIterations)”to run EM. The output is the log-likelihood of EM clustering. E.g. test = EM(data2, 3, 0.0001, 200)

3. Select K: type “nEM(data, maxK, epsilon, nIterations)”to run EM. The output is the log-likelihood of EM clustering. E.g. test =  nEM(data2, 6, 0.0001, 300)

4. When dealing with particular dataset(like dataset2), change the code a bit(delete # before “center = data[sample(nlen, k), ]”) to use random initialization can achieve better result.