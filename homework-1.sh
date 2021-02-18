#!/bin/bash

E_No_Target_Directory=85

GitHubUsername="KaloyanLazarov" #can use arguments the same way target_directory does 
GitHubEmail="kaloqntl@abv.bg"

if [ $# -gt 0 ]; then
	Target_Directory="$1"
else
	echo "To use the script you need to pass the directory name as argument"
	echo "Usage: $(basename "$0") target_directory"
	exit $E_No_Target_Directory
fi

mkdir $Target_Directory
cd $Target_Directory

git init

git config --global user.name "$GitHubUsername"
git config --global user.email "$GitHubEmail"

git remote add master git@github.com:KaloyanLazarov/Endava-Homework

cp ../$(basename "$0") "$(basename "$0")"

git status
git add "$(basename "$0")"
git commit -m "First commit" "$(basename "$0")" 
git push --set-upstream master master
git push master

date > current_date.txt

git add current_date.txt
git commit -m "Adding the current_date.txt" current_date.txt
git push master

git branch update_file
git checkout update_file
git branch

date >> current_date.txt

git add current_date.txt
git diff current_date.txt
git commit -m "Updating the current_date file"
git push --set-upstream master update_file
git push master

