# acces_edition_rails

Test technique Accès Editions

## requis pour lancer l'app :

sudo pacman -S docker-compose
sudo pacman -S docker

## commandes pré-lancement :

bundle install
docker-compose up -d # backgroud docker
rails db:create rails db:migrate
rails db:seed (pour créer des données de test)

## dépendances du projet :

Devise
