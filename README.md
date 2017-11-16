# CSV Reader

A full-stack technical challenge I took too seriously, written in two different stacks. In this repo, you've got Elm on the front end and Elixir Phoenix on the back.

([Here's original app with Vue and Sinatra](https://github.com/philliplongman/csv-reader-vue))

### Requirement summary:

* Write a web app that will accept CSV files in three slightly different formats and display them as a sortable table.

[Try it here](https://csv-reader-elixir.herokuapp.com/) with one of the test files below.

Test files (right click then select, "Save link as"):
* [Comma separated file](https://raw.githubusercontent.com/philliplongman/csv-reader-elixir/master/test/fixtures/commas.csv)
* [Pipe separated file](https://raw.githubusercontent.com/philliplongman/csv-reader-elixir/master/test/fixtures/pipes.csv)
* [Space separated file](https://raw.githubusercontent.com/philliplongman/csv-reader-elixir/master/test/fixtures/spaces.csv)

## Design decisions

### Original

Since the project was so simple and didn't call for any persistence, I originally built it in Ruby with Sinatra. I thought it would be fun to submit the files asynchronously and return data via JSON for a single-page app, using Vue.js on the front end.

### Conversion

Converting the original app seemed like a great first project for Elixir and Elm.

Getting into the functional mindset was a challenge for me. Since I'm a Rubyist, I had a much easier time with Elixir/Phoenix. I struggled a little more with the static typing and different syntax of Elm.

I used ExUnit for testing the backend. Since Elm compiles into Javascript, I was able to use Wallaby with PhantomJS to test integration.


## Project info

You will need Elixir, Elm, and Yarn installed. To run the tests, you will need PhantomJS.

To setup:
```
mix deps.get
yarn install
cd web/elm
elm package install
```

To run:
```
mix phoenix.server
```
The app will be served at [localhost:4000](http://localhost:4000).

To test:
```
mix test
```
