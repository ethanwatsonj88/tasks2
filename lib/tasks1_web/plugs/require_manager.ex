defmodule Tasks1Web.Plugs.RequireManager do
	use Tasks1Web, :controller

	def init(args), do: args

	def call(conn, _params) do
		user = conn.assigns[:current_user]
		user_shown = conn.assigns[:user_shown]
		if user.is_manager do
			conn
		else
			conn 
			|> put_flash(:error, "Only managers are allowed to add tasks.")
			|> redirect(to: Routes.page_path(conn, :index))
			|> halt
		end
	end
end
