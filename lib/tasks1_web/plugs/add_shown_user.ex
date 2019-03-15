defmodule Tasks1Web.Plugs.AddShownUser do
	use Tasks1Web, :controller
	import Plug.Conn

	def init(args), do: args

	def call(conn, params) do
		user_shown = params
		IO.puts "ASSIGNING USER SHOWN"
		IO.inspect conn.assigns[:user_shown]
		assign(conn, :user_fake, user_shown)
	end

	def call(conn, params, user) do
		user_shown = user
		IO.puts "ASSIGNING LOSER SHOWN"
		IO.inspect user_shown
		assign(conn, :user_shown, user_shown)
	end
end
