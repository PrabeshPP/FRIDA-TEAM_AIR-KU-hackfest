import torch.nn as nn
import torch.nn.functional as F 
import torch
import numpy as np
import requests, json
from pathlib import Path

lons = np.array([80.2, 80.5, 80.6, 80.8, 80.9, 81.2, 81.4, 81.7, 81.8, 82.3, 82.4,
              82.9, 83.2, 83.6, 84.0, 84.4, 84.6, 85.0, 85.2, 85.3, 85.5, 85.6,
              85.9, 86.2, 87.3, 87.9])
lats = np.array([26.7, 26.9, 27.0, 27.2, 27.6, 27.7, 27.9, 28.0, 28.1, 28.2, 28.3,
              28.8, 29.0, 29.2, 29.3, 29.5, 29.6, 29.9, 30.0])

def get_one_hot(lon,lat):
    diff_lon = np.abs(lons - lon)
    diff_lat = np.abs(lats - lat)
    eye_lon = np.eye(lons.shape[0])
    eye_lat = np.eye(lats.shape[0])

    eye_lon[np.argmin(diff_lon)]
    return np.concatenate((eye_lat[np.argmin(diff_lat)], eye_lon[np.argmin(diff_lon)],))

#key = open(Path(__file__).resolve().parent / "key.txt").read()
#url = "http://api.openweathermap.org/data/2.5/weather?appid="
# kathmandu or any other nepali xity hanera try garum hai ta kta ho

def get_weather(key,url,city):
    response = requests.get(url+key+city+'&units=metric')
    response = response.json()
    lon = response['coord']['lon']
    lat = response['coord']['lat']
    temp = response['main']['temp']
    ps = response['main']['pressure']/10
    humid = response['main']['humidity']
    wind = response['wind']['speed']
    try:
        pcpt = response['rain']['3h']
    except Exception as e:
        pcpt = 0
    one_hot = get_one_hot(lon,lat)
    response = np.append(one_hot,[pcpt,ps,humid,temp,wind])
    return response.astype(np.float32)

#inp = torch.tensor(get_weather(key,url,city)).unsqueeze(0)

class LogisticRegression(nn.Module):
  def __init__(self):
    super().__init__()
    self.linear1 = nn.Linear(50,32)
    self.linear2 = nn.Linear(32,16)
    self.linear3 = nn.Linear(16,16)
    self.linear4 = nn.Linear(16,1)
    self.relu = nn.ReLU()
    self.sigmoid = F.sigmoid

  def forward(self,x):
    x1 = self.linear1(x)
    x2 = self.relu(x1)
    x3 = self.linear2(x2)
    x4 = self.relu(x3)
    x5= self.linear3(x4)

    y = self.sigmoid(self.linear4(x5))
    return y

model = LogisticRegression()
model.load_state_dict(torch.load(Path(__file__).resolve().parent /'model.pt',map_location=torch.device('cpu')))

model.eval()
#print(model.input.item())
