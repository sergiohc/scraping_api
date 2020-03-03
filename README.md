#RUN PROJECT#

docker-compose build
docker-compose bundle install
docker-compose run --rm app bundle exec rake db:create
docker-compose run --rm app bundle exec rake db:migration
docker-compose up
