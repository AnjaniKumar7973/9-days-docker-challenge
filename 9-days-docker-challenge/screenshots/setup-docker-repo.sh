#!/bin/bash

# Repo name
REPO_NAME="9-days-docker-challenge"

echo "🚀 Creating Docker Learning Repo Structure..."

# Create main folder
mkdir -p $REPO_NAME
cd $REPO_NAME || exit

# Create day-wise folders
for i in {01..09}
do
  case $i in
    01) NAME="Docker-Introduction" ;;
    02) NAME="Docker-Commands" ;;
    03) NAME="Docker-Images" ;;
    04) NAME="Dockerfile" ;;
    05) NAME="Volumes" ;;
    06) NAME="Networking" ;;
    07) NAME="Docker-Compose" ;;
    08) NAME="Real-Project" ;;
    09) NAME="Advanced" ;;
  esac

  mkdir -p Day-$i-$NAME
  touch Day-$i-$NAME/README.md
done

# Create project folder
mkdir -p project/app-code
touch project/Dockerfile
touch project/docker-compose.yml

# Create screenshots folder
mkdir -p screenshots

# Create main README
touch README.md

echo "✅ Folder structure created successfully!"
echo "📁 Navigate: cd $REPO_NAME"