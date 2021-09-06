# frozen_string_literal: true

require 'rails_helper'

describe Post, type: :model do
  describe '#title_and_body' do
    context 'when post has title and body' do
      it 'return full data about post' do
        post = Post.create(title = 'title')

        expect(post.title_and_body).to eq('title: body')
      end
    end
  end
end
