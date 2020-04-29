#!/usr/bin/env bash

git config user.name "Circle CI"
git config user.email "yfjd01@gmail.com"

message="Deploy commit $(git rev-parse HEAD)"
echo "Deploying $(git rev-parse HEAD) to master"

rm .gitignore # We want all compiled assets! ALL OF THEM
mv .gitignore.deploy .gitignore
git add --all
git commit -m "$message"
git push --force "git@github.com:yfjd01/yfjd01.github.io.git" develop:master
echo "Deployed! Going to sleep..."