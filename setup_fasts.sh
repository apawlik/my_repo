#!/bin/bash -e

#This is a simple script for setting up fastStructure

## STEP 1
## 1.1 Make sure we are in home directory.
## 1.2 create a project directory (if it doesn't exist) and navigate into it

cd $HOME

if [ -d fastStructure_workshop ] 
then
   echo "You have already set up fastStructure_workshop directory."
else
   mkdir fastStructure_workshop
fi

cd fastStructure_workshop

## STEP 2 Get the data
## 2.1 Create a directory for the data 
## 2.2 Download the data from online source
if [ -d data ]
then
   echo "You already set up a directory for your data." 
else
   mkdir data
fi

cd data

curl -L https://github.com/apawlik/bioinf-scripts/raw/master/fastStructure/data/MacroPopGenBase.zip -o MacroPopGenBase.zip
curl -L https://github.com/apawlik/bioinf-scripts/raw/master/fastStructure/data/prubi_gbs.vcf.gz -o prubi_gbs.vcf.gz
curl -L https://github.com/apawlik/bioinf-scripts/raw/master/fastStructure/data/final_strains.vcf.gz -o final_strains.vcf.gz
curl -L https://github.com/apawlik/bioinf-scripts/raw/master/fastStructure/data/Re__fastStruct_workshop.zip -o Re__fastStruct_workshop.zip

unzip MacroPopGenBase.zip
rm MacroPopGenBase.zip

gunzip prubi_gbs.vcf.gz
rm prubi_gbs.vcf.gz

gunzip final_strains.vcf.gz
rm final_strains.vcf.gz

unzip Re__fastStruct_workshop.zip
rm Re__fastStruct_workshop.zip

cd ..

## STEP 3 get the scripts 

if [ -d scripts ] 
then
   echo 'Scripts directory already exists.'
else
   mkdir scripts
fi  

cd scripts

curl -L https://raw.githubusercontent.com/apawlik/bioinf-scripts/master/fastStructure/scripts/faststructure_chooseK_distruct.sh -o faststructure_chooseK_distruct.sh
chmod +x faststructure_chooseK_distruct.sh

curl -L https://raw.githubusercontent.com/apawlik/bioinf-scripts/master/fastStructure/scripts/faststructure_updated.bash -o faststructure_updated.bash
curl -L https://raw.githubusercontent.com/apawlik/bioinf-scripts/master/fastStructure/scripts/plink_vcf2bed.sh -o plink_vcf2bed.sh
cd ..

## Download fastStructure module
if [ -d modules ] 
then
   echo 'modules directory already exists.'
else
   mkdir modules
fi

cd modules

curl -L https://github.com/apawlik/bioinf-scripts/raw/master/fastStructure/modules/fastStructure.zip -o fastStructure.zip
unzip fastStructure.zip
rm fastStructure.zip
