class UserSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :password_digest, :email
end
