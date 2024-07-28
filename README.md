# Mtgweb

# Domain
mtg-consulting.net  (netlify)

## SCOTT ADDITIONS
https://btihen.me/post_elixir_phoenix/phoenix_1_6_petal_setup_with_asdf/
add credo to mix deps: {:credo, "~> 1.6", only: [:dev, :test], runtime: false}

See https://andrewbarr.io/posts/removing-npm/show

## Fy IP Commands
 mtgweb % fly ips list
VERSION	IP                 	TYPE  	REGION	CREATED AT           
v4     	137.66.0.150       	public	global	2022-09-04T05:33:11Z	
v6     	2a09:8280:1::6:6e09	public	global	2022-09-04T05:33:13Z	

 mtgweb % fly ips release 137.66.0.150 -a mtgweb
Released 137.66.0.150 from mtgweb
scottsproule@Scotts-Mac-mini mtgweb % fly ips allocate-v4 --shared -a mtgweb
VERSION	IP            	TYPE  	REGION 
v4     	66.241.125.190	shared	global

Point the DNS to above


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` 

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides]

fly deploy

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
