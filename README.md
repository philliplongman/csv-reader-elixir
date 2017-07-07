# CSV Reader

A full-stack technical challenge I took too seriously, with asynchronous Vue.js on the front end and Elixir Phoenix on the back.

([Also with a Ruby back end](https://github.com/philliplongman/csv-reader-vue))

### Requirement summary:

* Write a web app that will accept CSV files in three slightly different formats and display them as a sortable table.

[Try it here](https://csv-reader-elixir.herokuapp.com/) with one of the test files below.

Test files (right click then select, "Save link as"):
* [Comma separated file](https://raw.githubusercontent.com/philliplongman/csv-reader-elixir/master/test/fixtures/commas.csv)
* [Pipe separated file](https://raw.githubusercontent.com/philliplongman/csv-reader-elixir/master/test/fixtures/pipes.csv)
* [Space separated file](https://raw.githubusercontent.com/philliplongman/csv-reader-elixir/master/test/fixtures/spaces.csv)

## Design decisions

#### Original

Since the project was so simple and didn't call for any persistence, I originally built it in Ruby with Sinatra. I thought it would be fun to submit the files asynchronously and return data via JSON for a single-page app, using Vue.js on the front end.

#### Conversion

Converting the app seemed like a great first project for Elixir Phoenix. That was true on the back end. The front was a little more complicated.

Brunch didn't play well with Vue, so I had to rip it out and use webpack to serve assets.

I didn't want to convert my Slim files to the wordier EEx format, so I added PhoenixSlime. Later, an unsolvable JS problem with one of the Vue dependencies turned out to just be a slight syntax difference between Slim & Slime. Serves me right for being lazy.

If I have the opportunity later, I'd like to replace the front end with Elm.

I used ExUnit and Wallaby for testing. Wallaby with PhantomJS allowed me to test JavaScript integration, but I had to use Babel to transpile down to ES2015.

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
