#!/bin/bash

# Check if Git is installed

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git and try again."
    exit 1
fi

# Check if Curl is installed

if ! command -v curl &> /dev/null; then
    echo "Curl is not installed. Please install Curl and try again."
    exit 1
fi

datascience_repo() {

  # Check if a repository name was provided

  if [ -z "$1" ]; then
    echo "No repository name provided."
    return 1
  fi

  local repo_name="$1"
  local token="$GITHUB_TOKEN"

  # Create a new repository on GitHub

  local response=$(curl -H "Authorization: token $token" https://api.github.com/user/repos -d "{\"name\": \"$repo_name\", \"private\": true}")

  if echo "$response" | grep -q "Repository creation failed."; then
    echo "Failed to create repository on GitHub."
    return 1
  fi

  # Initialize the skelton of the repository

  mkdir "$repo_name" && cd "$repo_name" || return 1
  git init
  echo "# $repo_name" >> README.md
  git add README.md
  echo -e "all:\n\t@echo 'Makefile commands'\n\ninstall:\n\t@echo 'Installing...'" >> Makefile
  git add Makefile
  echo "drafts/*\nraw_data/*\n__pycache__/\n*.py[cod]\n*$py.class" > .gitignore
  git add .gitignore
  echo "pytest\npylint\nipdb\njupyter\njupyterlab\nnumpy\npandas\nmatplotlib\nseaborn\nscikit-learn" > requirements.txt
  git add requirements.txt
  mkdir app && cd app
  mkdir ml_logic
  touch ml_logic/__init__.py ml_logic/data.py ml_logic/preprocess.py
  git add ml_logic/__init__.py ml_logic/data.py ml_logic/preprocess.py
  cd ..
  mkdir scripts && touch scripts/__init__.py
  git add scripts/__init__.py
  mkdir tests
  git add tests
  touch Dockerfile
  git add Dockerfile
  git commit -m "Initial commit"
  git branch -M main
  git remote add origin git@github.com:$GITHUB_USERNAME/$repo_name.git
  git push -u origin main
}

# Call the function with script arguments
datascience_repo "$@"
