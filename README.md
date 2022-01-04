# Large-Scale-Data-and-Retrieval-Final-Project
DS4300 Final Project Alicia Wheeler, Daniel Rossshirt, Tatum Gaudinski Whitehead, Jialin Zhen

## Abstract
This project leverages the unique graphing capabilities of Neo4J to perform an exploratory analysis on statistical differences between the categorical and quantitative attributes of songs. The goal is to examine trends and relationships between songs to further understand the music industry and the structure of songs. The examination is performed in a Neo4J network graph. Queries on the graph revealed that songs distinguished by decade and genre still have similar attributes to other genres and decades; there are consistency between-song attributes across the many genres/decades in the industry.

### Process
Initially, our group desired to create an engine to recommend songs to users. That is cliche and had already been done so we changed courses. We began our project using MongoDB but quickly decided that Neo4J would better suit our needs. Instead of trying to implement our own version of the Spotify “Go to Song Radio'' feature as discussed in the project proposal, we pursued an exploration of attribute similarity across genre and decade.

There are vast numbers of unique sounding songs. The purpose of this exploration is to understand features that differentiate songs from one another and explore possible connections between genres and decades of songs.

## Design

### Data Collection
The data used is a CSV file. Data were obtained from the Spotify API and contains sixteen different attributes for a collection of 41,000 + songs. The dataset is stored in a GitHub repository.

### Data Wrangling
The data is imported from the GitHub repository into a Jupyter notebook for preprocessing. Four of the sixteen attributes — tempo, danceability, acousticness, and energy — are selected from the dataset. The song name, genre, and decade are selected from the original data as well. The Pandas library is used to store and manipulate data as a DataFrame. The tempo was normalized using a min_max_scaler to the range [0, 1]. One hundred songs are selected at random for further analysis. The Euclidean distance between the four selected quantitative attributes for each song is computed. Each pair of songs will represent a link in the graph. The final export of the data is two CSV files: one which contains the nodes (100 songs with attributes) and one which contains the links (pairs of songs with the euclidean distance between the pair).

### Data Import
Both CSV files are imported into MySQL using the MySQL Import Wizard. In MySQL, a
schema called songs is created. In the schema, the two datasets are stored as nodes and links.
The data is imported into Neo4J using the APOC API for MySQL. In MySQL, a server song is created with the newly created song schema. Two views are created to import data into Neo4J. One view is for the nodes table and consists of 100 songs. The second view is for the links table. The 20th percentile of links is selected. Thus, the view is queried to import only 1000 links. This is done to reduce the size of the graph to avoid occlusion.

### Querying in Neo4J
The focus of the queries is to better understand the music industry via the relationship between a song’s derived and categorical attributes. The queries in Neo4J are focused on producing significant visual representations. The data does require intricately designed queries. By writing direct queries we are able to get the most information from the graph.
Disabling the “connect result nodes” function in the graph visualization setup of Neo4J is very helpful in creating straightforward and efficient queries.
 
## Results & Analysis
The analysis compares euclidean distance to identify patterns between songs with low euclidean distances using categorical attributes. Three thresholds for euclidean distance are queried to compare the songs:
● n.euclidean < 0.121576

● n.euclidean < 0.206442

● n.euclidean < 0.259790

1st percentile 5th percentile 10th percentile
Thresholds are selected from percentile values obtained from a call to the .describe() method on Pandas DataFrame in the preprocessing portion of the project. An in-depth report of categorical attributes queried at percentile thresholds can be found here. Queries to the Neo4J graph produced visualizations of songs clustered by links that met the specified euclidean threshold. Links between categorical attributes genre and decade are examined for each threshold.
