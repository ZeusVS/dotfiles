# First we create the chrome folder, then make a symbolic link there
# We loop over the found wildcards to that we put the userChrome in all default directories
profile=~/.mozilla/firefox/*default
for i in $profile; do
rm -rf "$i/chrome"
mkdir $i/chrome
ln -s "$HOME/dotfiles/firefox/userChrome.css" "$i/chrome/"
done
