# README

## Features / TODO

* [x] App exists
* [ ] User can sign up/log in
  * [ ] All logged in interactions are user stamped
* [ ] User can add/edit a basic contact (name, relationship type[family,friend,acquaintance,who dis?], relationship depth [close..far], desired closeness level[close..far])
* [ ] User can log interacting with a contact (form fields: date, autocompletable name)
* [ ] App shows log of yesterday's interactions
* [ ] App suggests top three friends to reach out to today
* [ ] User can import contacts from:
  * [ ] Important: Imported contacts include additional information (image, handle, contact info, etc)
  * [ ] Google contacts
  * [ ] Facebook
  * [ ] Twitter
* [ ] App provides interface for quickly categorizing relationship distance and desired closeness level of new contacts
* [ ] App provides interface for de-duping contacts
* [ ] User can import interactions from:
  * [ ] Important: Imported interactions include bare minimum information to be able to link back to the interaction in the source application (e.g. only preview of email subject lines, rather than full emails; the fact that there was a FB message, rather than the message itself)
  * [ ] Gmail
  * [ ] Facebook
  * [ ] Twitter
  * [ ] Google calendar invites
  * [ ] Phone calls (via. native app?)
* [ ] App mines vague calendar entries to suggest yesterday's interactions (E.g. "Meeting w/ John M." would yield suggestions that you may have met with contacts John Moore or John McKay)

## Development

This README documents the steps that are necessary to get the application up and running.

* Ruby version

  * See `.ruby-version` file.

* System dependencies

  * Postgresql
  * Node
  * Yarn

* Configuration

  * `cp config/database.example.yml config/database.yml`

* Database creation

  * `rake db:create:all`

* Database initialization

  * `rake db:migrate`

* How to run the test suite

  * `rake`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

