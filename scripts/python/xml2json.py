import xmltodict
import json
import os
import sys

directory=sys.argv[1]

for filename in os.listdir(directory):
  if filename.endswith(".xml"):
    file_xml_path = os.path.join(directory, filename)
    file_pure_name = os.path.splitext(filename)[0]
    file_json_name = file_pure_name + '.json'
    file_json_path = os.path.join(directory, file_json_name)
    with open(file_xml_path, 'r') as xml_in, open(file_json_path, "w+") as json_out:
      xmlString = xml_in.read()
      json_as_string = json.dumps(xmltodict.parse(xmlString), indent=4)
      json_out.write(json_as_string)