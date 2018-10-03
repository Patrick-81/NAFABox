################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# On October 2018
# V0.1
################################################
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(find ~ -name ConfigTinker)

figlet -k Install BrowsePy
echo "================================================="
echo "================================================="

######
# recupere le user
######
home=$HOME
data=$dirinstall
cd $dirinstall
# s'assurer que que pip est installe
pip_installed=$(which pip)
if [ -z "$pip_installed" ]
then
	# installer browsepy
	pip install pip
fi
sudo pip install browsepy
# Lancer le serveur au demarrage
# placer la commande sous .config/autostart
cat browsepy.desktop | sed -e "s#MOI#${home}#g" > /tmp/browsepy.desktop

cp /tmp/browsepy.desktop $HOME/.config/autostart/.
# fin


