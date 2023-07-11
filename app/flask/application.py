import requests
from flask import Flask, request, render_template, json, jsonify
import logging
import names
import random_address
import random
from flask_caching import Cache

config = {
    "DEBUG": True,  # some Flask specific configs
    "CACHE_TYPE": "SimpleCache",  # Flask-Caching related configs
    "CACHE_DEFAULT_TIMEOUT": 300
}

application = Flask(__name__)
#: Method A: During instantiation of class
cache = Cache(config={'CACHE_TYPE': 'SimpleCache'})
#: Method B: During init_app call
cache.init_app(application, config={'CACHE_TYPE': 'SimpleCache'})
application.config["DEBUG"] = False
logging.basicConfig(filename='record.log', level=logging.DEBUG, filemode="w")
newHeaders = {'Content-type': 'application/json', 'Accept': 'text/plain'}


@application.route('/index', methods=['GET'])
@cache.cached(timeout=5)
def get_html():
    try:
        if request.method == 'GET':
            return render_template('index.html')
    except Exception as ex:
        application.logger.critical(ex)
        return ex


@application.route("/universities")
@cache.cached(timeout=5)
def get_universities():
    API_URL = "http://universities.hipolabs.com/search?country="
    search = request.args.get('country')  # Query parameter
    r = requests.get(f"{API_URL}{search}")
    return jsonify(r.json())


@application.route('/user', methods=['GET'])
@cache.cached(timeout=5)
def get_user():
    try:
        if request.method == 'GET':
            return __generate_user_details()
    except Exception as ex:
        application.logger.critical(ex)
        return ex


def __generate_user_details():
    _user = {
        'firstName': names.get_first_name(),
        'lastName': names.get_last_name(),
        'address': __get_random_address(),
        'age': __get_age(10, 99),
        'gender': __get_gender()
    }
    _user_details = json.dumps(_user, indent=4)
    return _user_details


def __get_gender():
    random_index = random.randint(0, 1)
    if random_index == 1:
        return 'Female'
    else:
        return 'Male'


def __get_random_address():
    _address = random_address.real_random_address()
    return _address


def __get_age(min_age: int, max_age: int):
    _age = random.randint(min_age, max_age)
    return _age


if __name__ == '__main__':
    application.run(host='0.0.0.0', port=9003, debug=True)
