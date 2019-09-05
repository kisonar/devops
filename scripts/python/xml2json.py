import xmltodict
import json
import os

directory = '/home/marcin/development/GS/testing-inputs'

for filename in os.listdir(directory):
  print filename
  if filename.endswith(".xml"):
    filepathxml = os.path.join(directory, filename)
    f = open(filepathxml, 'r')
    text = f.read()
    xpars = xmltodict.parse(text)
    json = json.dumps(xpars)
    print json

    continue
  else:
    continue


