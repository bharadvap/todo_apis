json.(user, :id, :email, :first_name, :last_name)
json.token user.generate_user_auth_token if controller_name == "sessions"