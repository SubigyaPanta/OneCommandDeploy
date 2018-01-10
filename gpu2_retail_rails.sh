echo "Update started.."
# Set ruby path via rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# Reload shell with updated env variables
#exec bash

cd ~/Subigya/Programs/rails/
# git stash
# git pull origin web
# git apply
echo "Fetching from git"
# git pull origin web

cd ~/Subigya/Programs/rails/web/My-api-master
appdir="$(pwd)"
echo "App directory: "$appdir
curuser="$(whoami)"
echo "Current User: "$curuser

echo "Current Ruby and rails version: "
ruby -v
rails -v

echo "Installing all required Gems.."
bundle install

echo "Migrating databases.."
rails db:create RAILS_ENV=production
rails db:migrate RAILS_ENV=production

echo "Restarting server.."
touch tmp/restart.txt
