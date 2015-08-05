# FiveMinWordpressOnAWS
# personal blog project translated to TerraForm code, just for fun.


# The Script need administrator permissions and the access keys, please find and edit all of the keyword "----REPLACE----"

#install terraform
# test the code
terraform plan

# deploy or upgrade the environment
terraform apply

# Create graphs
apt-get install graphviz
sudo apt-get install graphviz
terraform graph | dot -Tpng >graph.png

#Integrate with Atlas if you want
https://consul.io/docs/guides/atlas.html
https://atlas.hashicorp.com/

