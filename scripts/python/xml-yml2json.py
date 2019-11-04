import os
import sys
import yaml
import json

directory=sys.argv[1]
files_litser = os.listdir(directory)
if len(files_litser) == 0:
  print("list is empty")
else :
      for filename in files_litser:
        print("filename" + filename)
        file_yml_xml_name_pure = os.path.splitext(filename)[0]
        file_yml_xml_path = os.path.join(directory, filename)
        if filename.endswith(".yml"):
          file_json_name = file_yml_xml_name_pure + '.json'
          file_json_path = os.path.join(directory, file_json_name)
          with open(file_yml_xml_path, 'r') as yaml_in, open(file_json_path, "w+") as json_out:
            yaml_object = yaml.safe_load(yaml_in)
            json_as_string = json.dumps(yaml_object, indent=4)
            json_out.write(json_as_string)
        if filename.endswith(".xml"):
          file_json_name = file_yml_xml_name_pure + '.json'
          file_json_path = os.path.join(directory, file_json_name)
          with open(file_yml_xml_path, 'r') as xml_in, open(file_json_path, "w+") as json_out:
            xmlString = xml_in.read()
            json_as_string = json.dumps(xmltodict.parse(xmlString), indent=4)
            json_out.write(json_as_string)