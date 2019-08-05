#!/bin/bash

# install prerequisits
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y wamerican

# Download watdiv generator
wget https://dsg.uwaterloo.ca/watdiv/watdiv_v06.tar
tar xvf watdiv_v06.tar
rm watdiv_v06.tar
pushd .
cd watdiv
make

# Create Dataset
cd bin/Release
./watdiv -d ../../model/wsdbm-data-model.txt 10000 | gzip > ../../../watdiv1000M.nt.gz

popd
