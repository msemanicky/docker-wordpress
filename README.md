# Zadanie na Docker Compose

### Zadanie
Úlohou je vytvoriť `docker-compose.yml` (a prislúchajúce `Dockerfile`s, prípadne konfiguračné súbory) ktorého výsledkom po spustení príkazu `docker-compose up` bude bežiaca inštalácia Wordpressu dostupná na hostovskom systéme na http://localhost:8080. Tá by mala pozostávať z dvoch kontajnerov:

* `web` - kontajner bežiaci webserver (_apache_ alebo _nginx_) a pod ním nainštalovaný Wordpress (stačí úplne [základná inštalácia](https://codex.wordpress.org/Installing_WordPress#Famous_5-Minute_Installation)) 
* `db` - kontajner bežiaci MySQL kompatibilnú databázu (_MySQL_, _MariaDB_, ...) na ktorú bude Wordpress napojený.

Oba kontajnery by mali byť vybuildované nad Docker base image-om [ubuntu:xenial](https://hub.docker.com/_/ubuntu/). 

