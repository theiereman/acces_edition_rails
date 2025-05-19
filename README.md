# Test technique Accès Editions

Création d'une application de gestion des événements permettant la visualisation d'événements publiques, la gestion de comptes utilisateurs et la gestion des événements par les utilisateurs.

## Installation de Docker / docker-compose

Le projet utilise une base de données PostgreSQL, qui est installée via docker-compose. Cela permet de ne pas avoir d'instance PostgreSQL sur son poste et de lancer sa base de données à sa guise via Docker.

- [docker-compose](https://docs.docker.com/compose/install/)
- [docker](https://docs.docker.com/engine/install/)

## Initialisation du projet

#### Installation des gems et initialisation du projet Rails

```bash
  bundle install
```

#### Lancement de la base de données et du serveur Rails

```bash
  docker-compose up -d
```

**Note** : il se peut que le port utilisé par PostgreSQL soit déjà utilisé par une autre instance. Si c'est le cas, il faut modifier le port dans le fichier `docker-compose.yml` et dans le fichier `config/database.yml`.

#### Création de la base de données et alimentation des données de test

```bash
  rails db:create rails db:migrate
  rails db:seed
```

#### Lancement du serveur Rails

```bash
  rails s
```

## Gems supplémentaires utilisées pour le projet :

#### Authentification (sessions et JWT)

- [Devise](https://github.com/heartcombo/devise)

- [Devise JWT](https://github.com/waiting-for-dev/devise-jwt)

Ces 2 gems ont été choisies pour simplifier la mise en place de l'authentification. L'utilisation d'une gem aussi répendue permet de grandement limiter la possibilité de faille dans son système d'authentification.

Pour rester dans le même écosystème et ne pas avoir à gérer une gem d'authentification différente pour le JWT, j'ai choisi de m'appuyer sur la gem `devise-jwt` qui est une extension de `devise`.

[master.key](https://guides.rubyonrails.org/security.html#custom-credentials) pour mettre à jour le JWT (normalemnet pas nécessaire)

master.key = 8c48d3afa533337adc2b3f62ebbeba80

#### Pagination

- [Pagy](https://github.com/ddnexus/pagy)

J'ai choisi cette gem pour sa simplicité d'utilisation et sa performance. L'ajout d'une pagination peut rapidement polluer le code d'un controlleur s'il est mal implémenté. L'utilisation d'une gem externe permet justement de limiter ça sans perdre de temps et en rajoutant quasiment aucun code supplémentaire dans les controlleurs paginés.

## Pistes d'améliorations

- Ajout de différents tests unitaires / fixtures pour favoriser la non-régression et permettre d'ajouter des fonctionnalités sans craindre de tout casser.

- Améliorer l'interface utilisateur, la version actuelle a été fait rapidement afin de rendre quelque chose a minima présentable.

- Mettre en place une CI/CD pour le déploiement continu. L'utilisation de [Kamal](https://kamal-deploy.org/) peut être une bonne solution que j'ai déjà utilisé plusieurs fois pour mes projets.

- Envisager l'utilisation d'un framework front (React / Vue) s'il est nécessaire d'avoir beaucoup d'interactivité. Des outils comme [Inertia](https://inertia-rails.dev/guide/) permet une mise en place facile permettant la combinaison des avantages de Rails avec un frontend javascript récent.

- Ajouter de l'i18n (pour le moment anglais uniquement)

- etc.

## Contact

En cas de problème avec le lancement de l'app, envoyez-moi [un mail](mailto:thomas.eyermann@protonmail.com)
