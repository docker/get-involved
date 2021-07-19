from flask import Flask
from datetime import datetime
import requests
import redis
import os
from dotenv import load_dotenv
import json

load_dotenv()  # take environment variables from .env.


app = Flask("app")

def get_quote_from_api():
	API_URL = "http://quotes.rest/qod.json"
	resp = requests.get(API_URL)
	if resp.status_code == 200:
		try:
			quote_resp = resp.json()["contents"]["quotes"][0]["quote"]
			return quote_resp
		except (KeyError, IndexError) as e:
			print (e)
			return None
	else:
		return None


@app.route("/")
def index():
	return "Welcome! Please hit the `/qod` API to get the quote of the day."


@app.route("/qod")
def quote_of_the_day():
	# get today's date in string
	date = datetime.now().strftime("%Y-%m-%d")
	quote = redis_client.get("date")
	if not quote:
		quote = get_quote_from_api()	
	return "Quote of the day: " + quote




if __name__ == '__main__':
	# Connect to redis client
	redis_host = os.environ.get("REDIS_HOST", "localhost")
	redis_port = os.environ.get("REDIS_PORT", 6379)
	redis_password = os.environ.get("REDIS_PASSWORD", None)
	redis_client = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password)

	# Run the app
	app.run(port=8080, host="0.0.0.0")



