## App with postgres DB, Tailwind CSS, Javascript esbuild
rails new chess --database postgresql --css tailwind --javascript esbuild

## Edit credentials.yml file cmd
$env:EDITOR="code --wait"; rails credentials:edit

## Docker Commands
rails c => docker-compose exec chess-web bin/rails console # Since My db is hosted in Docker
