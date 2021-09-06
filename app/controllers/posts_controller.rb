# frozen_string_literal: true

class PostsController < ApplicationController
  around_action :set_post, only: %i[show edit name_of_post update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_handler

  def wrap_in_transaction
    :verify_authenticity_token
    begin
      yield
    ensure
      puts 'Hello!'
    end
  end

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  def last_post
    @posts = Post.last
  end

  def name_of_post
    @posts = Post.Title
  end

  # GET /posts/1 or /posts/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json {}
      format.xml
      format.pdf do
        render pdf: 'post'
      end
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def record_not_found_handler
    respond_to do |format|
      format.json { render json: { msg: 'Not found', status: 404 }, status: :not_found }
      format.html { render html: 'Not found' }
      format.xml { render xml: { msg: 'Not found', status: 404 } }
      format.pdf { render html: 'Not found' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
    begin
      yield
    ensure
      puts 'Hello!'
    end
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :published)
  end
end
