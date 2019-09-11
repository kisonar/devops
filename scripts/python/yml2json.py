import os
import sys
import yaml
import json

directory=sys.argv[1]

for filename in os.listdir(directory):
  if filename.endswith(".yml"):
    file_yml_path = os.path.join(directory, filename)
    file_name_pure = os.path.splitext(filename)[0]
    file_json_name = file_name_pure + '.json'
    file_json_path = os.path.join(directory, file_json_name)
    with open(file_yml_path, 'r') as yaml_in, open(file_json_path, "w+") as json_out:
      yaml_object = yaml.safe_load(yaml_in)
      json_as_string = json.dumps(yaml_object, indent=4)
      json_out.write(json_as_string)