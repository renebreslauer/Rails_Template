# README

This is a boilerplate Rails project that uses:

- `ruby ~> 2.7`
- `postgresql` as the database
- `webpacker` with `react`
- the `react_on_rails` gem [docs](https://github.com/shakacode/react_on_rails)
- the `administrate` gem [docs](https://github.com/thoughtbot/administrate)
- The `trix` gem [docs](https://github.com/maclover7/trix)
- The `bootstrap` gem [docs](https://github.com/twbs/bootstrap-rubygem)
- The `whenever` gem [docs](https://github.com/javan/whenever)
- The `faker` gem [docs](https://github.com/faker-ruby/faker)
- The `sidekiq` gem [docs](https://github.com/mperham/sidekiq/wiki/Getting-Started#rails)
- The `letter_opener_web` gem [docs](https://github.com/fgrehm/letter_opener_web)
- The `annotate` gem [docs](https://github.com/ctran/annotate_models)
- The `better_errors` gem [docs](https://github.com/BetterErrors/better_errors)
- The `kaminari` gem [docs](https://github.com/amatsuda/kaminari#the-page-parameter-is-in-paramspage)
- ActiveText enabled for `trix`.
- ActiveStorage enabled and configured for an S3 compatible bucket.

## Setup

- `bundle`
- `yarn`
- `rails db:create db:migrate db:seed` (with your Postgres server up and running)
- `EDITOR='vim' rails credentials:edit --environment=development` and configure S3 credentials (optional)
- `rails s`

Sign in to admin account with `admin@admin.com` and to user account with `some@guy.com` or `some@gal.com`.  
Password is defaulted to `password` for all seeded accounts.

## Deployment

### The Node.js buildback must be added first or precompiling of assets may fail on Heroku: [See this issue](https://github.com/rails/webpacker/issues/1164#issuecomment-443474860)

- `heroku create your-app-name`
- `heroku buildpacks:set --index 1 heroku/nodejs`
- `heroku buildpacks:add heroku/ruby`
- `git push heroku master`
- `heroku run rails db:migrate`
- _optional_: `heroku run rails db:seed`
