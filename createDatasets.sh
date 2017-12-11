#!/bin/bash

# Download BTC2014 dataset
wget http://km.aifb.kit.edu/projects/btc-2014/000-CONTENTS
wget -x -nH -i 000-CONTENTS
rm 000-CONTENTS

# Move and rename dataset files
mkdir btc2014
for f in ./projects/btc-2014/data/crawls/*
do
  base=$(basename "$f")
  for d in "$f"/data.nq*.gz
  do
    file=$(basename "$d")
    fileExtension=${file:7}
    filename="${fileExtension%.*}"
    mv "$d" "btc2014/data-${base}${filename}.nq.gz"
  done
done
rm -r projects

# Clone Koral
git clone https://github.com/Institute-Web-Science-and-Technologies/koral.git
cd koral
mvn package
cd ..

# Create subsets
java -cp koral/target/koral.jar playground.SubsetCreator btc2014/ btc2014_500MSubset.nq.gz 500000000
java -cp koral/target/koral.jar playground.SubsetCreator btc2014/ btc2014_1000MSubset.nq.gz 1000000000
java -cp koral/target/koral.jar playground.SubsetCreator btc2014/ btc2014_2000MSubset.nq.gz 2000000000
