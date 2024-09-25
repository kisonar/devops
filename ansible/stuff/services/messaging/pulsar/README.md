# Pulsar

## Arming web-ui with new admin addount
```  
Run script to setup admin access for manager
admin/apachepulsar
```

## Manager
http://localhost:9527/#/environments

#### Manger setup
The pulsar-manager supports multiple environment configurations and can manage multiple environments conveniently.

Here, the service URL represents the service IP address of the broker. 
If you run Pulsar manager in the standalone mode, it should be set to "http://127.0.0.1:8080". 
You can easily find it in the client.conf file of your pulsar-manager.

And the bookie URL represents the service IP address of the bookkeeper. 
If you run Pulsar manager in the standalone mode, it should be set to "http://127.0.0.1:6650".

In our setup use:
service url: http://broker:8080
bookie url: http://bookie:6650