# Application ASKME

ASKME is an application-clone of the famous service [ask.fm](https://ask.fm/). It allows you to ask questions to different users. Questions can be asked by registered users and anonymous. Please note that application has a ReCapthca anti-spam system from Google.


## Annotation

Application was created on `Ruby (v2.5.1)` and `Ruby on Rails (v5.2.2)`. You can watch a list of all used gems in the `Gemfile`.

## Installation and running

Before running the application, you need to install all the necessary gems and prepare the database. In order to do this, you need to run the following comands in the terminal:
```
bundle install
bundle exec rake db:migrate
```

Then, run the local server:
```
bundle exec rails s
```

After, go to the browser at `http://localhost:3000`.

## Technical debt

List of technical debts which will be added soon in the application:
* To add hashtags feature.
* To delete the old version of ReCaptcha, to add the last version of Recapthca (`Invisible Recapthca`).

## Author

**Kirill Ilyin**, study project from [goodprogrammer.ru](https://goodprogrammer.ru/)
