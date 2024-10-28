"""Defining controllers"""

import os
import subprocess
import re

import requests
from django.http import HttpRequest, JsonResponse, HttpResponse
from http import HTTPStatus

from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

from documents.models import Sensor
from documents.schemas import SensorIn, DocumentIn

import matplotlib.pyplot as plt
from io import BytesIO

def chat(request):
    zawartosc = ""
    with open(BASE_DIR / 'chat.txt', 'r') as plik:
        zawartosc = plik.read()

    r_response = {"response": zawartosc}
    
    return JsonResponse(r_response)