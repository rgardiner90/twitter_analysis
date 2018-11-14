#install.packages("twitteR")
library(twitteR)

# GREAT: http://rstatistics.net/extracting-tweets-with-r/ 

consumer_key <- "JgxYi5TVnSG6DDd4qUmePSz9X"
consumer_secret <- "aYNSmkqengscfFZDRBt2oqziM8a8St0UZ9q1QKQBKukTAOs0G9"
access_token <- "2735714393-1eA01BxfZBm4AQuH2VAAwQmH7JP0EtUH4rdCFBw"
access_secret <- "j8bCOWzbbHixidPaB24bPmTGOqHOiRRQBGZm9cqnRduQS"



setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret) # sets up authorization

# this will return tweets that mention "@realDonaldTrump", but not Trump's messages"
Donald <- searchTwitter('@realDonaldTrump' , n = 4000, since = '2016-11-08', retryOnRateLimit = 1e3)
A <- twListToDF(Donald)
View(A)
write.csv(a, 'DonaldTesting.csv', row.names=F)

# this willreturn any mention of realDonaldTrump AND HillaryClinton. Get only a few
DonaldAndHillary <- searchTwitter('#realDonaldTrump + #HillaryClinton' , n = 400, since = '2016-11-08', retryOnRateLimit = 1e3)
DH <- twListToDF(DonaldAndHillary)
View(DH)
write.csv(DH, 'DonaldAndHillary.csv', row.names=F)

TrumpTweets <- userTimeline('@realDonaldTrump',n=1000, includeRts = TRUE) # tweets from a user
Trump_Tweets <- twListToDF(TrumpTweets)
View(Trump_Tweets)
write.csv(Trump_Tweets, "TrumpTweets4Rebekah.csv", row.names = F)


# My Personal Info
RichardTweets <- homeTimeline (n=1000) # get tweets from home timeline
Richard_Tweets <- twListToDF(RichardTweets)
View(Richard_Tweets)

RichardMentions <- mentions (n=15) # get your tweets that were retweeted
Richard_Mentions <- twListToDF(RichardMentions)
View(Richard_Mentions)

favs <- favorites("r_programming", n =100) # tweets a user has favorited
My_favs <- twListToDF(favs)
View(My_favs)

richard <- getUser('rgardiner90')
richard$friendsCount

richardFollowers <- richard$getFollowers()
richardFollowers

UGA_SPIA <- getUser('UGA_SPIA')
UGA_SPIA$friendsCount # people they are following

UGA_SPIA_Followers <- UGA_SPIA$getFollowers(retryOnRateLimit = 180)
length(UGA_SPIA_Followers)

# geocoding
apartment <- searchTwitter('apartment hunting', geocode='40.7361,-73.9901,5mi',  n=5000, retryOnRateLimit=1)
b = twitteR::twListToDF(apartment)
View(b)



# TRENDING
trend<-getTrends(woeid=2459115) # this is what is trending in NYC. Look up location (woeid) 
head(trend,20)
dim(trend)

install.packages('wordcloud')
wordcloud(Trump_Tweetss,min.freq=10,max.words=100, random.order=T)
