# pip3 install -r requirements.txt
import yaml
import json


def _finditem(obj, key):
    if key in obj:
        return obj[key]
    for k, v in obj.items():
        if isinstance(v, dict):
            item = _finditem(v, key)
            if item is not None:
                return item


with open(r'example.yml') as file:
    yml = yaml.load(file, Loader=yaml.FullLoader)

    print(yml)
    print(type(yml))  # Dict or List
    researched = _finditem(yml, "tabitha")
    print(researched)
