# CSV Reader

A full-stack technical challenge I took too seriously, with asynchronous Vue.js on the front end and Elixir Phoenix on the back.

([Also with a Ruby back end](https://csv-reader.herokuapp.com))

### Requirement summary:

* Write a web app that will accept CSV files in three slightly different formats and display them as a sortable table.

[Try it here](https://csv-reader-elixir.herokuapp.com/) with one of the test files below.

Test files (right click then select, "Save link as"):
* [Comma separated file](https://github.com/philliplongman/fullstack-challenge-ruby/raw/master/test/fixtures/commas.csv)
* [Pipe separated file](https://github.com/philliplongman/fullstack-challenge-ruby/raw/master/test/fixtures/pipes.csv)
* [Space separated file](https://github.com/philliplongman/fullstack-challenge-ruby/raw/master/test/fixtures/spaces.csv)

## Design decisions

Since the project was so simple and didn't call for any persistence, I originally built it in Ruby with Sinatra. I thought it would be fun to submit the files asynchronously and return data via JSON for a single-page app, using Vue.js on the front end.

Converting such a simple app seemed like a great first project for Elixir Phoenix. That was true on the back end. The front was a little more complicated. Brunch didn't play well with Vue, so I had to rip it out and use webpack to serve assets.

I didn't want to convert my Slim markup to wordier EEx, so I added PhoenixSlime. Later, an unsolvable JS problem with one of the Vue dependencies turned out to just be a slight syntax difference between Slim & Slime. Serves me right for being lazy.

I'll be adding some tests with ExUnit very soon.

## Project info

To run:
```
mix deps.get
npm install
mix phoenix.server
```
The app will be served at [localhost:4000](http://localhost:4000).

To test:
```
mix test
```
