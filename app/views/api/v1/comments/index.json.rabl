object false

child (@comments) do
  extends 'api/v1/comments/show'
end

node(:_links) do
  paginate @comments
end
