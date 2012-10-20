json.status 401
if @user.nil?
  json.message ["can not find user with email address : #{params[:user][:email]}"]
else
  json.message ["wrong password for login with email address : #{params[:user][:email]}"]
end
