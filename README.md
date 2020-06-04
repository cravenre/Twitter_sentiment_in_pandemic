# Changing Public Sentiment During Pandemic

COVID-19 has had a large and inescapable impact on all of our lives, both personally and professionally. As a result of that upheaval, many people's viewpoints of the world around them have changed during that time. As a healthcare worker, I have felt that change directly. I have gone from an little known role to one that is now recognized and celebrated. My goal was to study societal viewpoints toward other aspects of life and how those have changed over time during the COVID-19 pandemic. Because we are a digital society, and because lockdowns, quarantines, and stay-at-home orders have forced us to live remotely, I decided to look at public opinion through the lens of social media. I will look at public sentiment as measured by the content of Twitter posts because they are short, quick ways for people to express what they are thinking, feeling, and experiencing.

# Methods and Workflow

Over 70 million tweets were downloaded spanning from December 1, 2019 to April 30, 2020. The tweets were found in 3 separate datasets. One contained only tweet IDs rather than the full tweet data for privacy reasons. These tweets had to be hydrated using twarc with a Twitter API and was done in chunks due to the size of the data files. The tweet ID's were chunked in a random order to ensure that each chunk contained a representative distribution of tweets across the date range. The tweets were then filtered down to only those using English and adding a column for week in addition to the date the tweet was created. I then performed an initial entity analysis of the tweet text using spaCy to determine which named entities appear most often in the dataset. Based on this analysis, I identified 21 entities covering people, locations, organizations, and sports (because we can all use a little enjoyment) that encompass many entities that are of high importance and named often in the tweet set. The tweets were then grouped into entity datasets based upon whether the text contains words associated with the entity. The entity grouped tweets were then analyzed using VADER to determine the overall sentiment of each tweet. The tweets were finally grouped by week they were created and score distribution was determined.

# Data Used

www.trackmyhashtag.com/data/COVID-19.zip  
    Smaller set of 60,000+ tweets from December 1, 2019 - January 28, 2020

https://zenodo.org/record/3738018#.XtJGWi2ZPyK  
    Large set of over 150 million tweets  
    January 27, 2020 - April 22, 2020  
    Dedicated collection with larger volume after March 11  
    Updated daily with current tweets  
    Only contains tweet ID, not text or other information  

https://www.kaggle.com/smid80/coronavirus-covid19-tweets  
    Three sets of roughly 15 million tweets  
    March 1, 2020 - April 30, 2020  
    Does not contain retweets  
