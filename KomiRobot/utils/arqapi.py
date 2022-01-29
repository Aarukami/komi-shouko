import json
import sys
from random import randint
from time import time


from google_trans_new import google_translator
from Python_ARQ import ARQ
from search_engine_parser import GoogleSearch

from KomiRobot import BOT_ID, OWNER_ID, ARQ_API_URL, ARQ_API_KEY
from KomiRobot import pbot

ARQ_API = "OQHXVK-MIWIHG-XQYKBM-RTQQCF-ARQ"
ARQ_API_KEY = "OQHXVK-MIWIHG-XQYKBM-RTQQCF-ARQ"
SUDOERS = OWNER_ID
ARQ_API_URL = "https://thearq.tech"

# Aiohttp Client
print("[INFO]: INITIALZING AIOHTTP SESSION")
print("[INFO]: INITIALIZING ARQ CLIENT")
arq = ARQ(ARQ_API_URL, ARQ_API_KEY)

app = pbot
import socket
