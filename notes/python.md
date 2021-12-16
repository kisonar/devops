# Python
```
sudo dnf install python3
sudo dnf install python3-pip

ls /usr/bin/python*
ln -s /usr/bin/python3.6 /usr/local/sbin/python

or 
alternatives --install /usr/bin/python python /usr/bin/python3.6 2
alternatives --install /usr/bin/python python /usr/bin/python2.7 1
alternatives --config python

python --version

pip3 install pyyaml
pip3 install xml2dict
```