import xmltodict
import json
import os
import sys
import pprint

#directory = '/home/importer/ftp'
directory=sys.argv[1]

for filename in os.listdir(directory):
  if filename.endswith(".xml"):
    print filename
    filepathxml = os.path.join(directory, filename)
    file = open(filepathxml, 'r')
    xmlContentAsDict = xmltodict.parse(file.read(),encoding='utf-8')
    jsonContent = json.dumps(xmlContentAsDict, indent=1)
    jsonContentNoNewLines = jsonContent.replace('\n','')
    purefilename = os.path.splitext(filename)[0]

    jsonfilenamepartial = purefilename + '.json-partial'
    jsonfilename = purefilename + '.json'

    filepathjson = os.path.join(directory, jsonfilename)
    filepathjsonpartial = os.path.join(directory, jsonfilenamepartial)

    with open(filepathjsonpartial, 'wr') as outfile:
      pp = pprint.PrettyPrinter(indent=1, stream=outfile)
      pp.pprint(jsonContentNoNewLines)
    with open(filepathjsonpartial) as filein, open(filepathjson,'wr') as fileout:
      for line in filein:
        line=line.replace("'","") # remove ' from beginning of JSON created from XML
        fileout.write(line)
    os.remove(filepathjsonpartial) # remove json-partail