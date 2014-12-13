object @post

attributes :title, :text, :votes, :created_at, :updated_at

child :user do
  attributes :email, :username
end
