# Build your own local FOSSBilling Docker Image

# based on os Install required packages using apt, yum or apk 

apt update &&

apt install wget unzip git -y &&

# Install Docker

curl -fsSL https://get.docker.com -o get-docker.sh &&

sh get-docker.sh &&

# Download or Clone FOSSBilling-Docker by Skcry

git clone https://github.com/skcry/FOSSBilling-Docker.git &&

# change into FOSSBilling-Docker directory

cd FOSSBilling-Docker &&

# create FOSSBilling Directory Then Change Directory

mkdir FOSSBilling &&

cd FOSSBilling &&

# download latest FOSSBilling Release

wget https://github.com/FOSSBilling/FOSSBilling/releases/latest/download/FOSSBilling.zip &&

# unzip FOSSBilling.zip in FOSSBilling Directory

unzip FOSSBilling.zip &&

# Remove FOSSBilling.zip

rm FOSSBilling.zip &&

# Change into tmp directory

cd .. &&

# update path-to-FOSSBilling in Dockerfile in this case /tmp/FOSSBilling using sed or any text editor

sed -i 's+path-to-fossbilling+./FOSSBilling+g' Dockerfile &&

# bulid docker image using Dockerfile

docker build -t local-fossbilling . &&

# once build completes you can use your local build FOSSBilling Docker Image

docker run -d -p 80:80 local-fossbilling &&

# clean up

cd .. &&
rm -r FOSSBilling-Docker &&
rm get-docker.sh
