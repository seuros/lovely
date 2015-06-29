class User < ActiveRecord::Base
  loves :posts
  loves :comments
end