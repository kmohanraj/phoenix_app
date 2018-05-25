# PhoenixApp

Elixir Version:
````````````````````
  Elixir 1.6.5 

Phoenix Version

  Phoenix v1.3.2


Create New Phoenix App

 mix phx.new phoenix-app --mysql           #if you want specific database

```````````````````````````````````````````````
Create Model
````````````````````````````````
 mix phx.gen.schema User users name:string email:string password:string

```````````````````````````````````
Reference User for ForeignKey in Message Table
``````````````````````````````````````
#if use this type of command it will create inside the model folder

mix phx.gen.schema Model.Message messages name:string message:string user_id:references:users

``````````````````````````````````````````

Create the (WebSocket) "Channel"
 
 Generate the (WebSocket) channel to be used in the chat app:
``````````````````````````````````````
  mix phx.gen.channel Room

This will create two files:

* creating lib/phoenix_app_web/channels/room_channel.ex
* creating test/phoenix_app_web/channels/room_channel_test.exs


Chat App Github Link

https://github.com/dwyl/phoenix-chat-example

`````````````````````````````````````````

Insert Messages into Database
`````````````````````````
Open the lib/chat_web/channels/room_channel.ex file and inside the function def handle_in("shout", payload, socket) do add the following line:

Chat.Message.changeset(%Chat.Message{}, payload) |> Chat.Repo.insert  
So that your function ends up looking like this:

def handle_in("shout", payload, socket) do
  Chat.Message.changeset(%Chat.Message{}, payload) |> Chat.Repo.insert  
  broadcast socket, "shout", payload
  {:noreply, socket}
end

````````````````````````````````````````````

Database
-----------------------------

Then configure your database

  config/dev.exs

Create Database

  mix ecto.create


Migrate Database

  mix ecto.migrate

``````````````````

RollBack 

  mix ecto.rollback

``````````````````

Install dependencies 

  mix deps.get


mix phx.gen.json

Generates controller, views, and context for an JSON resource.

`````````````````````````````````
mix phx.gen.json Model User users name:string age:integer

`````````````````````````````

Web namespace
By default, the controller and view will be namespaced by the schema name.
 You can customize the web module namespace by passing
  the --web flag with a module name, for example:

mix phx.gen.html Sales User users --web Sales


Which would geneate a 
lib/app_web/controllers/sales/user_controller.ex and lib/app_web/views/sales/user_view.ex.

Generate a Migration
Let’s generate a migration to add fields to our User model.

mix ecto.gen.migration add_fields_to_users



$ mix phoenix.gen.html → which creates: model, view, controllers, repository, templates, tests
$ mix phoenix.gen.channel → which creates: channel and tests
$ mix phoenix.gen.json → for API, which creates: model, view, controllers, repository, tests
$ mix phoenix.gen.model → which creates: model and repository


Routes:
````````````
mix phoenix.routes

``````````````````

start your Phoenix server:
`````````````````````````````
  mix phx.server

You can also run it inside IEx (Interactive Elixir) as:
`````````````````````````````
  iex -S mix phx.server

```````````````````````

Phoenix Specific Mix Tasks
➜ mix help | grep -i phx
mix local.phx          # Updates the Phoenix project generator locally
mix phx.digest         # Digests and compresses static files
mix phx.digest.clean   # Removes old versions of static assets.
mix phx.gen.channel    # Generates a Phoenix channel
mix phx.gen.context    # Generates a context with functions around an Ecto schema
mix phx.gen.embedded   # Generates an embedded Ecto schema file
mix phx.gen.html       # Generates controller, views, and context for an HTML resource
mix phx.gen.json       # Generates controller, views, and context for a JSON resource
mix phx.gen.presence   # Generates a Presence tracker
mix phx.gen.schema     # Generates an Ecto schema and migration file
mix phx.gen.secret     # Generates a secret
mix phx.new            # Creates a new Phoenix v1.3.0 application
mix phx.new.ecto       # Creates a new Ecto project within an umbrella project
mix phx.new.web        # Creates a new Phoenix web project within an umbrella project
mix phx.routes         # Prints all routes
mix phx.server         # Starts applications and their servers
````````````````````````````


