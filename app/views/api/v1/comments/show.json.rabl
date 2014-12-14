object @comment

attributes :id, :text, :created_at, :updated_at

child :user do
  attributes :email, :username
end
