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
    f = open(filepathxml, 'r')
    text = f.read()
    xmlContentAsDict = xmltodict.parse(text,encoding='utf-8')
    print "XML to dickt"
    jsoncontent = json.dumps(xmlContentAsDict, indent=1)
    print "Generated JSON content is: "
    print jsoncontent
    jsoncontent = jsoncontent.replace('\n','')

    purefilename = os.path.splitext(filename)[0]
    jsonfilename = purefilename + '.json'
    filepathjson = os.path.join(directory, jsonfilename)
    with open(filepathjson, 'w') as outfile:
      pp = pprint.PrettyPrinter(indent=2, stream=outfile)
      pp.pprint(jsoncontent)
  else:
    continue