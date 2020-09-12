import requests
import re


def get_ip():
    url = requests.get("http://txt.go.sohu.com/ip/soip")
    text = url.text
    ip = re.findall(r'\d+.\d+.\d+.\d+', text)
    ip = 'http://' + ip[0] + ':8000/'
    # ip = 'http://127.0.0.1:8000/'
    return ip
