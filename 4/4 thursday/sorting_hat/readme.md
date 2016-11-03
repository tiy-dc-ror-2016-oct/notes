# Cross Class Repo
This repo is designed to allow cross class collaboration. Each discipline has a folder
`server` for backend and `client` for the frontend.

### Frontenders

All of your work will be confined to the `client` folder, your package.json should be inside this folder.

Any HTML, CSS, Images that are inside of `client/public` will be served by the ruby app.

```
- client/
  - public/
    - css/
      - app.css
```
The respective link tag for the above folder structure would be

```html
<link rel='stylesheet' href='/css/app.css'>
```

### Backenders

Most of your work will be constrained to the `server` folder save for your Gemfile. This is for the easy of deployment to heroku (if we get there)

# New Things
  1. Database config is located at
  2. Migrations via `rake db:migrate`
  3. Torch db via `rake db:drop`

## Deploying to heroku

1. Ensure you have heroku toolbelt
2. Run `heroku create`
3. Run `heroku addons:create heroku-postgresql:hobby-dev` to add a postgres DB server
3. Run `heroku run "cd server; rake db:migrate"` to migrate your servers database
