# frozen_string_literal: true

xml.instruct!
xml.article do
  xml.id(@post.id)
  xml.title @post.title
  xml.body @post.body
  xml.created_at @post.created_at
  xml.updated_at @post.updated_at
end
