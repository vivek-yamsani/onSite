# TASK-1
### MERGE AND REPLACE
Usage 
for replace
```bash 
./replace.sh <column_name> <finding_parameter> <replace_string>
```  
for merging files
```bash 
./merge.sh
```  

# TASK-2
### LOAD BALANCER
#### Normal Mode
Creating servers
```bash
sudo docker-compose up
```
To make apache server on as load-balancer run
```bash
./hostConf.sh
```