# FiveMinWordpressOnAWS
Personal blog project translated to TerraForm code, just for fun.

The Script need administrator permissions and the access keys, please find and edit all of the keyword "----REPLACE----"

 

##Install <a href="https://www.terraform.io">Terraform</a>

###Test the code
terraform plan

###Deploy or upgrade the environment
terraform apply

 

### Create graphs
- apt-get install graphviz
- sudo apt-get install graphviz
- terraform graph | dot -Tpng >graph.png

 

###Integrate with Atlas if you want

https://consul.io/docs/guides/atlas.html
https://atlas.hashicorp.com/
