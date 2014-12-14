object @post

attributes :id, :title, :text, :votes, :created_at, :updated_at

child :user do
  attributes :email, :username
end

child :comments do
  extends 'api/v1/comments/show'
end
