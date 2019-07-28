# Application ASKME

ASKME is an application-clone of the famous service [ask.fm](https://ask.fm/). It allows you to ask questions to different users. Questions can be asked by registered users and anonymous. Please note that application has a ReCapthca anti-spam system from Google.


## Annotation

Application was created on `Ruby (v2.5.1)` and `Ruby on Rails (v5.2.2)`.

## Installation and running

Before running the application, you need to install all the necessary gems and prepare the database. In order to do this, you need to run the following commands in the terminal:
```
bundle install
bundle exec rake db:migrate
```
Next you need to rename `.env.development.example` file in `.env.development` and set up variable environments for reCaptcha:

```
RECAPTCHA_ASKME_PUBLIC_KEY=YOUR PUBLIC KEY
RECAPTCHA_ASKME_PRIVATE_KEY=YOUR PRIVATE KEY
```

Then, run the local server:
```
bundle exec rails s
```

After, go to the browser at `http://localhost:3000`.

You can watch a list of all used gems in the `Gemfile`.

## Heroku deployment

Study project is ready for deployment on the Heroku. The working version of the project can be viewed at [`Heroku website`](https://cuurjol-askme.herokuapp.com/).

## Author

**Kirill Ilyin**, study project from [goodprogrammer.ru](https://goodprogrammer.ru/)
