# Classifying-Gamma-and-Hadron-Rays-by-LR-and-NB-Models
The data is of  gamma and hadron ray data. When running the tests you see that low z values for fLength, fM3long, and fAlpha mean that they are important to the models accuracy for classifying the rays. fLength is the length of the major axis of the ellipse. fM3long is the 3rd root of third moment along the major axis. fAlpha is the angle of major axis from vector to origin. 

 ![image](https://user-images.githubusercontent.com/70611669/121574692-8a094a80-c9f4-11eb-9703-e9e77c523888.png)


                                                                                                                                                                                  
	# Logistic regression:  
	![image](https://user-images.githubusercontent.com/70611669/121574732-92fa1c00-c9f4-11eb-8178-9c4502ed3048.png)


	# Naïve Bayes: 
	![image](https://user-images.githubusercontent.com/70611669/121574805-a3aa9200-c9f4-11eb-80e2-3c043af92de5.png)
	 

For LR, I first split my data 75 train, 25 test. I then used the glm() with class being the dependent variable. To find the prob of a ray being ‘g’ or ‘h’ ,  I used the predict function on my test data. Then for the two groups are based on the predicted probability of being ‘g’ or ‘h’.  Values above 0.5 are considered to be a hadron. While below 0.5 is considered a gamma. This models accuracy is measured by the mean of observations that have been correctly classified. If there is an incorrect classified hadron then we say its misclassified which will mean it’s a gamma.  This is done by taking the mean(predicted$classes == test$class). Which gives a  77% correct classification and a 23% misclassification. 

For NB it was easier to do but the accuracy was lower. For NB I started the same way as I did with LR with splitting the data and storing. I then used the naiveBayes function passing ‘class’ are the binomial. I then used a predict function on the testing data and placed it into a table with the test$class. Once the (pred, test$class) were in a table I used a conf_matrix to determine the accuracy of the model, it was 73%. 

Both of these functions deal with binomial probability. Logistic regression though uses a Bayes classifier and turn into a new equation. As the sum of  σ(B0 + B1x1 +…+ BpXp)   where σ is a sigmoid function. This function maximizes the likelihood for a decision boundary that will best separate the ‘g’ and ‘h’ class. For NaiveBayes it just classifies the data by the finding the probability of a given feature being associated with a label. This function minimizes the classification errors. 
