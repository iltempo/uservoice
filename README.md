# Uservoice feedback for Ruby on Rails

This adds [Uservoice](http://www.uservoice.com) support to your
Rails application including single sign-on.

## Installation

### As a gem
    gem install uservoice

### As a Rails dependency in your Gemfile
    gem 'uservoice'


## Configuration

### Via config/uservoice.yml

Generate config file for your app:

    rails generate uservoice install

Then open `config/uservoice.yml` and adjust settings as needed.

### Via initializer

Create `config/initializers/uservoice.rb` with the following content:

    UserVoice.config.merge!({:script_id => "XY"})

### Available settings

* Required: `script_id` is the ID of the widget you want to use (create a widget under Settings > Channels > Javascript Widgets and copy the ID from the code)
* Optional: `sso_key` is your Single Sign-on key that you find Settings > General > User Authentication > Change to "Single Sign-On"
* Optional: `subdomain is the subdomain of your uservoice URL (e.g. "acme" from "acme.uservoice.com")

Add javascript function and configuration to HTML BODY section of your template file:

    <%= uservoice_config_javascript %>


## Single Sign-On

Single sign-on authenticates your users automatically against the Uservoice
service. A second login is not needed any more. Uservoice is allowing single sign-on starting from the Premium plan.

To use single sign-on with on uservoice you have to set your `sso_key` and `subdomain in
`config/uservoice.yml. The user properties can be set via the `:sso` parameter:

    <%= uservoice_config_javascript(:sso => {:guid => @current_user.id, :email => @current_user.email}) %>

Parameter `:guid` should be unique identifier, for example the user id in your
system. Uservoice recommends setting `:email` parameter to enable users to get
updates and notifications via email.
See https://ACCOUNT.uservoice.com/admin2/docs#/sso for a list of parameters
available.


## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a
  commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.


This project is using [Semantic Versioning](http://semver.org).


##Author

[Alexander Greim](http://github.com/iltempo)


##Contributors

[Eric Wollesen](http://github.com/ewollesen)

[Kai Schlichting](http://github.com/lacco)


## Copyright

Copyright (c) 2010-2012 [il tempo](http://github.com/iltempo) -

[Alexander Greim](http://github.com/iltempo), released under the MIT license
