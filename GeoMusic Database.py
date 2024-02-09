#!/usr/bin/env python
# coding: utf-8

# In[1]:


import spotipy


# In[2]:


import sys


# In[3]:


import pandas as pd


# In[4]:


#this imports the credential system to make sure the user (me) is verified
from spotipy.oauth2 import SpotifyClientCredentials
#imports a .py file callede secret that contains my spotify secret
from spotify_secret import secret


# In[5]:


#client id
cid = '918c5a50ea4a45529b661c915a8c5570'

#establishing my credentials including my clinet id and client secret
client_credentials_manager = SpotifyClientCredentials(client_id=cid, client_secret=secret)

#this uses my credentials to use spotify api - only verified users can use the spotify api
sp = spotipy.Spotify(client_credentials_manager = client_credentials_manager)


# In[6]:


#the user can input a playlist; the playlist I added was "https://open.spotify.com/playlist/6qPgSMFoUA7H976hoC0HVO"
playlist_link = input('Enter link to playlist')
#splits through the entire data to make it easier to grab items
playlist_URI = playlist_link.split("/")[-1].split("?")[0]
track_uris = [x["track"]["uri"] for x in sp.playlist_tracks(playlist_URI)["items"]]


# In[7]:


#shows what the split looks like
sp.playlist_tracks(playlist_URI)["items"][0]


# In[8]:


#makes a dictionary that solely contains empty lists
playlist_dict = {'track_uri': list(),
                 'artist_name': list(),
                 'artist_id': list(),
                 'artist_popularity': list(),
                 'artist_genres': list(),
                 'song_title': list(),
                 'album': list()}


# In[9]:


#for loop to add information from playlist into the dictionary
for track in sp.playlist_tracks(playlist_URI)["items"]:
    
    playlist_dict['track_uri'].append(track["track"]["uri"])
    playlist_dict['artist_name'].append(track["track"]["artists"][0]["name"])
    playlist_dict['artist_id'].append(track["track"]["artists"][0]["id"])

    #helper variable to sort through artist info
    artist_info = sp.artist(track["track"]["artists"][0]["uri"])
    
    playlist_dict['artist_popularity'].append(artist_info["popularity"])
    playlist_dict['artist_genres'].append(artist_info["genres"])
    
    playlist_dict['song_title'].append(track["track"]["name"])
    playlist_dict['album'].append(track["track"]["album"]["name"])


# In[10]:


#Turns the dictionary playlist_dict into a dataframe called songs_df
songs_df = pd.DataFrame(playlist_dict)


# In[11]:


#prints first five songs to have a picture of what the data frame looks like
songs_df.head()


# In[12]:


#makes playlist information into a csv file
songs_df.to_csv('playlist_info.csv')


# In[13]:


import requests
import json


# In[14]:


#My api for geographically locating my ip address
ipstack_api = 'de81e0697801513e716f3b3fd2715c7d'
url = 'http://api.ipstack.com/check?access_key=' + str(ipstack_api)

response = requests.get(url)
data = response.json()
#determines the country i'm in (shown in abbreviated form so I can use it in a spotipy function
country = data['country_code']
print(country)

url = 'https://api.apilayer.com/spotify/search?q=' + str(country)

payload = {}

headers= {

  'apikey': cid
}

response = requests.request('GET', url, headers=headers, data = payload)
status_code = response.status_code
result = response.text
result = json.loads(result)


# In[15]:


import random

#picks a random artist id
random_item = random.choice(playlist_dict['artist_id'])

# makes the random artist id in a supportable format for the artist_related_artists function
artist_id = 'spotify:artist:' + random_item

#finds related artists
related = sp.artist_related_artists(artist_id)


#makes a dictionary that solely contains empty lists
recommended = {'artist_name': list(),
                 'artist_genre': list(),
                 'artist_popularity': list(),
                'artist_id': list(),
               'artist_top_tracks': list()
              }
#adds 10 recommended artists and info regarding them
for i in range(20):
    recommended['artist_name'].append(related['artists'][i]['name'])
    recommended['artist_genre'].append(related['artists'][i]['genres'])
    recommended['artist_popularity'].append(related['artists'][i]['popularity'])
    recommended['artist_id'].append(related['artists'][i]['id'])
    #empty list to temporarily hold each of the five songs in the for loop
    top_tracks = []
    #for loop to retrieve top 5 songs from each artist
    for j in range(5):
        artist_info = recommended['artist_id'][i]
        artist_id = 'spotify:artist:' + artist_info
        top_track = sp.artist_top_tracks(artist_id, country=country)
        this = top_track['tracks'][j]['name']
        top_tracks.append(this)
    recommended['artist_top_tracks'].append(top_tracks)
#Turns the recommended dictionary into a dataframe
df_recommended = pd.DataFrame(recommended)
df_recommended


# In[16]:


#makes recommended artists into a csv file
df_recommended.to_csv('recommended_artists_for_pai.csv')


# In[ ]:




