# frozen_string_literal: true

xml.instruct!
xml.articles do
  @posts.each do |article|
    xml.article do
      xml.id article.id
      xml.title article.title
      xml.body article.body
      xml.created_at article.created_at
      xml.updated_at article.updated_at
    end
  end
end
