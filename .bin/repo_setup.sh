#!/bin/bash

usage() 
{ 
  echo "Usage: repo_setup.sh [-f] <template> "
  echo "   -f  force overwrite existing files"
}

if [ $# -eq 1 ]; then
  templateDir="$1"
  cpArgs="-i"
elif [ $# -eq 2 ]; then
  if [ "$1" = "-f" ]; then
    cpArgs="-f"
  else
    usage
    exit 3
  fi
  templateDir="$2"
else
  usage
  exit 1
fi

if [ ! -e $templateDir/.git ]; then
  echo "<template> must be a directory containing a git repo"
  usage
  exit 2
fi

cat << EOF > /tmp/.gitignore
node_modules
*.swp
EOF

cp $cpArgs /tmp/.gitignore .

cp $cpArgs $templateDir/.editorconfig .
cp $cpArgs $templateDir/.eslintignore .
cp $cpArgs $templateDir/.eslintrc.js .
cp $cpArgs $templateDir/.prettierignore .
cp $cpArgs $templateDir/.prettierrc .
cp $cpArgs $templateDir/tsconfig.json .

mkdir src
mkdir test

cat << EOF > package.json
{
  "name": "tbd",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "test": "echo \"No tests defined!\" && exit 1"
    "lint": "eslint"
  },
  "license": "MIT"
}
EOF

echo "Install these packages"
echo "  npm install --save-dev eslint prettier eslint-config-prettier eslint-plugin-prettier local-web-server typescript"
