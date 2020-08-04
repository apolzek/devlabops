import yaml
import json

def checkValues(objYML):
    print(objYML)

    obj = yaml.dump(objYML, sort_keys=True)
    print(obj)

    for doc in objYML:
        for k, v in doc.items():
            print(k, "->", v)

with open(r'example.yml') as file:
    list = yaml.load(file, Loader=yaml.FullLoader)

    # for item in list:
    #     print(item)
    checkValues(list)

