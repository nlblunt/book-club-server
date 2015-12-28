json.array! @posts do |post|
    json.title post.title
    json.body post.body
    json.author post.user.username
end