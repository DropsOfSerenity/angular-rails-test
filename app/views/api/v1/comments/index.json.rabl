object false

extends 'api/v1/comments/show'

node(:_links) do
  paginate @comments
end
