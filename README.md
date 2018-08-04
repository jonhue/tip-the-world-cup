# Tip The World Cup

The 2018 World Cup is coming and with it comes the opportunity for a quick bet with friends & family.

### Development

This project uses [asdf](https://github.com/asdf-vm/asdf) as version manager, [Yarn](https://github.com/yarnpkg/yarn) as JavaScript package manager, and [Bundler](https://github.com/bundler/bundler) for Rubygems.

Dependencies are listed in the [.tool-versions](.tool-versions) file.

1. Clone this repository

    `$ git clone ssh://git@github.com/jonhue/tip-the-world-cup.git`

2. Database setup

    ```
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
    ```

3. Install dependencies

    ```
    $ asdf install
    $ yarn install
    $ bundle install
    ```

4. Start development server

    `$ bundle exec foreman start -f Procfile.dev`

### Deployment

The `master` branch of this repository is automatically deployed on Heroku.
