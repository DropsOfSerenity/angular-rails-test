# Angular and Rails example app

This is an experimentation repo where I can try different ways to mash angular
and rails together in one happy unison.

*Disclaimer: things on this repo will likely be broken as it's for my own
experimentation*

## Rundown

### Core Gems
* `angular-rails-templates` so that angular can be a part of the asset pipeline
* `rails-assets` to remove the extra bower step
* `devise` and `angular-devise` for user authentication
* `rabl` to serve an api

#### TODO
* Implement `Restangular` (not hard)
* Implement `Kaminari`

### Testings Gems

The following gems are used in the `:development, :test` groups and primarily
for unit testing/feature testing. As a requisite I wanted test coverage to be
complete and all aspects of testing covered.

* `capybara` for feature testing
* `poltergeist` for headless capybara with PhantomJS
* `database_cleaner` so capybara knows to clean up after itself
* `teaspoon` as a asset pipeline aware test runner for angular Jasmine
unit tests
* `factory_girl_rails` for nicer fixtures
* `rails-assets-angular-mocks` so that we can actually mock on Jasmine tests

#### TODO
* so far I've only tested a service with `$httpBackend` I want to try Jasmine
  spy's
* additionally I want an example here of how to test a directive, and a
  controller.
* API unit testing for the rails side.
* Model unit testing for the rails side.
