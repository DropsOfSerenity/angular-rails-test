object false

child (@posts) do
  extends 'api/v1/posts/show'
end

node(:_links) do
  paginate @posts
end
