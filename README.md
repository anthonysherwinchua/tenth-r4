 _  ___    _    _     ___    _
/ ||   | _| |_ | |_  / __> _| |_ ___  _ _  _ _
| || / |  | |  | . | \__ \  | | / . \| '_>| | |
|_|`___'  |_|  |_|_| <___/  |_| \___/|_|  `_. |
                                          <___'

## System Dependencies

The following are needed by this project:

* [PostgreSQL](http://www.postgresql.org/)

## External Services

## Getting Started

Clone this repository and bundle.

    git clone <repository-url>
    cd tenth-r4
    bundle install

Create a `database.yml` file from the sample and modify if necessary.
The defaults should be fine.

    cp config/database.yml.sample config/database.yml

Create a `.env` file from the sample so [dotenv](https://github.com/bkeepers/dotenv) can set the required environment variables.
Please obtain any missing values from the project administrator.

    cp .env.sample .env

Create and initialize the database.

    rake db:create
    rake db:migrate

Start the application server.

    bin/rails server

Access the application at [http://localhost:3000/](http://localhost:3000/).

## Optional Dependencies


## Testing

Run the test suite with [RSpec](https://github.com/rspec/rspec-rails).

    bin/rspec spec

Or have them run automatically with [Guard](https://github.com/guard/guard-rspec).

    bundle exec guard

## Deployment

The application is deployed to [Heroku](https://www.heroku.com/) at:


Ensure the Git remotes are set up:

    heroku git:remote --app tenth-r4 --remote production
    heroku git:remote --app tenth-r4-staging --remote staging

To deploy, just run:

    git push staging master
    git push production master

Do remember to specify the app name when running Heroku commands like so:

    heroku run --app tenth-r4 rake db:migrate
    heroku run --app tenth-r4-staging rake db:migrate
