# Spotify-Database
Group Members: Leah Sobral, Salwa Naveed
Title: GeoMusic Database: Crafting a Database Framework for Seamless Music Discovery Based on Location

Abstract:
Our project functions as a bridge between Spotify's vast music database and using geographical data, it aims to craft a personalized music discovery experience. Initially, it establishes a connection to Spotify's database, allowing the retrieval and organization of intricate details about playlists, songs, artists, and albums. Simultaneously, it utilizes an IP locating service to discern the user's country, a crucial element for tailoring recommendations. Leveraging this geographical information, the code then scouts for artists similar to those in the user's playlist, collecting top tracks from these artists to curate a set of recommendations. In essence, the code orchestrates a fusion between music data and geographical insights, culminating in a system that not only suggests music based on user preferences but also takes into account regional music tastes, delivering a more personalized and contextually relevant music discovery platform.

Background and Significance:
The technical intricacies of the code directly contribute to the project's pivotal goal: delivering tailored music experiences based on both individual preferences and geographical context. By tapping into Spotify's expansive database and integrating geographical data, the code crafts a unique data frame that transcends standard music recommendations. This combination allows users not only to discover music they might enjoy based on their listening history but also introduces a geographical dimension, reflecting regional music tastes and trends. This significance lies in the enhancement of personalized experiences, as users encounter music suggestions made not just based on their individual preferences but also influenced by the cultural backdrop of their location. The combination of these elements enriches music discovery by offering contextually relevant recommendations, fostering a deeper connection between users and the music they explore. Ultimately, it aims to redefine how users engage with and experience music, with personalization with geographic relevance to create a more immersive and meaningful musical journey.

Methodology:
The code in our project operates by interfacing with both the Spotify and IPStack APIs, harmonizing music data with geographical insights to enhance the music discovery process seamlessly.

Spotipy is a Python library that serves as a wrapper for the Spotify Web API, enabling developers to interact with Spotify's music database and access various functionalities programmatically within their Python applications. It simplifies the process of integrating Spotify's API into Python code by providing a convenient set of methods and functions.
In the code provided, Spotipy is fundamental in interfacing with the Spotify API to retrieve playlist details, track information, and related artists' data. It facilitates the authentication process with the Spotify API through methods like SpotifyClientCredentials, allowing users to access Spotify's resources securely.

By utilizing Spotipy's functions like playlist_tracks, artist, and artist_related_artists, the code accesses specific endpoints of the Spotify API, fetching relevant data such as track URIs, artists' details, genre information, and popularity metrics. Spotipy's intuitive interface simplifies the extraction and manipulation of this data, making it easier to handle and process within the Python environment.

To introduce a geographical context, the code interacts with the IPStack API, determining your country based on your IP address. This geographical insight becomes pivotal in tailoring music recommendations based on regional music preferences and trends.

Compiling this wealth of information, the code structures it into a cohesive format: a DataFrame. This compilation encompasses details about similar artists, their genres, popularity metrics, and a curated selection of their top tracks. The output, in the form of a Pandas DataFrame, that can be converted to a CSV file, serves as the basis for generating personalized music recommendations. These recommendations blend your individual listening history with the prevailing musical trends and preferences of your geographical location.

In the provided code, the ‘sp’ import represents an instance of the Spotipy library's Spotify class. This class allows developers to interact with Spotify's API to access music-related data. To gain access to Spotify's API, developers need a client ID and a client secret key, obtained by registering an application through Spotify's Developer Dashboard. The SpotifyClientCredentials method from Spotipy facilitates authentication by taking in these keys and setting up a client credentials manager. This authenticated instance (sp) is then used to make requests to the Spotify API.

Leveraging your country information, the code then explores Spotify's API, randomly selecting an artist from the gathered playlist data. It employs sp.artist_related_artists() to extract related artists with similar styles or genres. For each related artist, it retrieves their top tracks using sp.artist_top_tracks(), compiling a list of top tracks for every artist.

It's important to note that Spotify's API, like many others, imposes usage limitations or rate limits. These limits control the number of requests a developer can make within a specific time frame. Exceeding these limits could result in the API returning errors or temporarily blocking access. Hence, while using Spotipy and making requests through the ‘sp’ import, developers need to manage their usage carefully and stay within the API's rate limits to prevent hitting thresholds that might restrict access temporarily. If the rate limit is reached, the code may need to wait until the rate limit resets before making more requests to the Spotify API. When creating our queries and databases, we had to be extra careful as we had limited tries, which was one of the challenges we faced during this project.

This intricate interplay between Spotipy and IPStack APIs harmonizes music data and geographic insights, culminating in a robust recommendation system. It seamlessly intertwines personal music preferences with regional music inclinations, offering a refined, contextually rich music discovery experience tailored to individual tastes and geographic relevance.

Analysis:
The code's functionality in delivering location-based music recommendations hinges on its seamless integration of Spotify's vast music database with geographic data from the IPStack API. Initially, the code accesses Spotify's database, crucial for music-related information retrieval. However, this database primarily operates in Java, necessitating meticulous rewriting and transfer of functionalities to Python for compatibility within our existing Python framework.

Subsequently, the code extracts detailed playlist information from Spotify using sp.playlist_tracks(). This data, organized into a structured Pandas DataFrame, which forms the foundation for the music recommendation system. Concurrently, the code interfaces with the IPStack API, leveraging IP geolocation to ascertain the user's country, an important step for tailoring recommendations based on regional music preferences.

Regarding effectiveness, the code's interconnection of music data and geographic insights manifests in accurate, location-aware recommendations. The fusion of individual listening history with prevailing regional trends enhances the user's music discovery experience. However, the effectiveness also depends on the completeness and accuracy of the Spotify database and the geographical precision of the IPStack API.

Regarding performance, the code's scalability and efficiency warrant attention for future enhancements. As it stands, the code functions smoothly for smaller datasets and singular user interactions. Yet, optimizing query execution and handling larger datasets might improve scalability. Future iterations could explore data caching techniques or parallel processing to expedite recommendations.

Furthermore, for future updates, this project has the potential in enriching the recommendation algorithm. This can be done by incorporating machine learning models or collaborative filtering techniques that could refine recommendations based on more nuanced user preferences. By enhancing geographic precision or incorporating real-time data updates for evolving music trends it would augment the system's adaptability and user satisfaction.

Conclusion: 
Our project has successfully intertwined music data and geographical insights to craft a personalized music discovery experience. Accomplishments include integrating Spotify's music database into a Python framework and leveraging the IPStack API to tailor recommendations based on geographical context. Throughout this process, we faced a multitude of challenges such as the meticulous transition from Java-based Spotify functionalities to Python and ensuring accuracy in geographic data for precise recommendations, however we overcame them slowly through research and pulling everything we learned in class together.

Opportunities for enhancing the database architecture and recommendation system are vastly available. Ideas such as improving scalability to handle larger datasets and optimizing query execution would fortify the system's performance, or embracing machine learning models and collaborative filtering techniques presents avenues for refining recommendations based on nuanced user preferences. Additionally, enhancing geographic precision and incorporating real-time data updates for evolving music trends could augment the system's adaptability.

Ultimately, the project's core contribution lies in delivering a personalized music discovery platform that seamlessly blends individual listening history with geographic relevance. It offers users tailored music experiences reflective of their tastes while considering the dynamic nature of regional music trends. The accomplishments underscore the system's efficacy, while the challenges and improvement opportunities lay the groundwork for future refinements, ensuring a continuously enriched user experience in the realm of personalized music discovery.

References:
The code utilizes several APIs and resources to curate music recommendations based on a provided Spotify playlist. It begins by employing the Spotify API through the Spotipy library to access playlist information and extract track details from a given Spotify playlist link. The Spotify API is pivotal in gathering music data, including track URIs, artists' names, album details, and popularity metrics, which are organized into a Pandas DataFrame. This DataFrame compiles the playlist's track information, providing a structured view of the playlist's contents.

Moreover, the code integrates the IPStack API to determine the user's geographic location based on their IP address. This geographical information, specifically the user's country code, is obtained to enhance the relevance of music recommendations. The country code is utilized to identify available music markets and refine the retrieved music data based on geographical relevance.

Following this, the code randomly selects an artist from the playlist and utilizes the Spotify API to find related artists. This process involves retrieving details such as the name, genres, popularity, and top tracks of the recommended artists. The recommendations are further organized into a Pandas DataFrame that encapsulates various details about these suggested artists and their top tracks.

The generated DataFrames, songs_df (containing playlist information) and df_recommended (encompassing recommended artists and their top tracks), are exported to CSV files, enabling further analysis and data utilization beyond the code's runtime.

Code Breakdown: 
Here is a step by step breakdown of the code we wrote:
import spotipy
import sys
import pandas as pd
from spotipy.oauth2 import SpotifyClientCredentials
from spotify_secret import secret
cid = '918c5a50ea4a45529b661c915a8c5570'
client_credentials_manager = SpotifyClientCredentials(client_id=cid, client_secret=secret)
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)
playlist_link = input('Enter link to playlist')

Here, the script imports necessary libraries and sets up the Spotipy authentication by importing the client ID (cid) and client secret (secret) from an external file. It then creates a Spotipy instance (sp) by providing the client credentials, allowing access to the Spotify API. The user is prompted to input a Spotify playlist link.

playlist_URI = playlist_link.split("/")[-1].split("?")[0]
track_uris = [x["track"]["uri"] for x in sp.playlist_tracks(playlist_URI)["items"]]

The code extracts the unique identifier (URI) of the playlist from the provided link and uses Spotipy's playlist_tracks function to retrieve a list of track URIs from the specified playlist.

playlist_dict = {'track_uri': list(), 'artist_name': list(), 'artist_id': list(), 'artist_popularity': list(), 'artist_genres': list(), 'song_title': list(), 'album': list()}
for track in sp.playlist_tracks(playlist_URI)["items"]:
    # Extracts relevant track, artist, and album details
    playlist_dict['track_uri'].append(track["track"]["uri"])
    playlist_dict['artist_name'].append(track["track"]["artists"][0]["name"])
    playlist_dict['artist_id'].append(track["track"]["artists"][0]["id"])
    artist_info = sp.artist(track["track"]["artists"][0]["uri"])
    playlist_dict['artist_popularity'].append(artist_info["popularity"])
    playlist_dict['artist_genres'].append(artist_info["genres"])
    playlist_dict['song_title'].append(track["track"]["name"])
    playlist_dict['album'].append(track["track"]["album"]["name"])

This segment initializes an empty dictionary (playlist_dict) to organize track details and iterates over each track in the playlist obtained from the Spotify API. It extracts specific information such as track URI, artist name, ID, popularity, genres, song title, and album. These details are appended to the respective lists within the dictionary.

songs_df = pd.DataFrame(playlist_dict)
songs_df.head()

The code converts the populated dictionary (playlist_dict) into a DataFrame (songs_df) for structured representation and displays the first five rows of the Pandas DataFrame to provide a snapshot of the playlist's track details.

songs_df.to_csv('playlist_info.csv')

Finally, the script exports the DataFrame (songs_df) containing the playlist information to a CSV file named 'playlist_info.csv', allowing users to store and analyze the data locally.

SQL Queries:
The first query, ‘SELECT* FROM playlist_infor;’, initiates the data retrieval process from the ‘playlist_info’ table, therefore gathering all of the existing information from it to provide a comprehensive view of the stored data.

The ‘INSERT INTO recommended_artists’ query adds a bulk of new data to the ‘recommended_artists’ table. This query inserts multiple rows, each presenting an artist along with their genre, unique ID, and a list of their popular tracks. Therefore, it substantially contributes to expanding the ‘recommended_artists’ table with each artists’ information.

Following this, the query with, ‘SELECT* FROM recommended_artists;’ retrieves all of the entries present in the ‘recommended_artists’ table, and provides a complete view of the newly inserted data.

The next query, ‘SELECT DISTINCT ra.artist_name FROM recommended_artists ra INNER JOIN playlist_information pi ON ra.artist_name = pi.artist_name;’ is an inner join operation between the ‘recommended_artists’ and ‘playlist_infor’ tables. It extracts distinct artist names that appear in both tables, enabling the identification of artists which are common to both datasets. 

The following query, ‘SELECT ra.artist_name, COUNT(pi.artist_name) AS occurences_in_playlist FROM recommended_artists ra LEFT JOIN playlist_info pi ON ra.artist_name = pi.artist_name GROUP BY ra.artist_name ORDER BY occurrences_in_playlist DESC;' which dives deeper by counting occurrences of artists from ‘ra.artist_name = pi.artist_name GROUP BY ra.artist_name ORDER BY occurrences_in_playlist DESC;'’ in the ‘playlist_info’ table. This query presents a sorted list of artists along with the frequency of their appearance in the playlist dataset.

The next query, ‘SELECT DISTINCT SUBSTRING_INDEX(SUBSTRING_INDEX(artist_genre, ',', numbers.n), ',', -1) AS unique_genres FROM (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) AS numbers JOIN recommended_artists WHERE LENGTH(artist_genre) - LENGTH(REPLACE(artist_genre, ',', '')) >= numbers.n - 1 ORDER BY unique_genres;’ performs an intricate string manipulation to extract distinct genres from the ‘artist_genre’ column in the ‘recommended_artists’ table. These genres are sorted alphabetically to offer insight into the diverse music genres represented in our datasets.

Furthermore, the query, ‘SELECT artist_name, artist_popularity FROM (SELECT artist_name, artist_popularity FROM recommended_artists UNION SELECT artist_name, artist_popularity FROM playlist_info) AS combined_artists ORDER BY artist_popularity DESC;’ combines and sorts artists based on their popularity, intertwining the data from both ‘recommended_artists’ and ‘playlist_info’ tables to provide a complete list of artists ranked by popularity.

Our last query, ‘SELECT artist_genre, COUNT(artist_name) AS artist_count, AVG(artist_popularity) AS avg_popularity FROM recommended_artists GROUP BY artist_genre ORDER BY artist_count DESC;’ conducts an in-depth analysis by categorizing artists based on genres and computes the average popularity within each genre. This query aids in understanding genre-wise artist and counts their average popularity. This offers valuable insights into the distribution and popularity of different music genres within the dataset.

Disclaimer: 
Please note that the mentioned queries above, represent a selection chosen for their significance in exploring and understanding the dataset. The dataset likely contains more queries and analyses that could yield further insights and perspectives. The queries highlighted in this discussion were chosen based on their relevance and potential impact on the understanding of the dataset. Other queries and analyses not explicitly discussed here might also contribute valuable information to a comprehensive examination of the dataset.
