class PostImagesController < ApplicationController
	def new
  end

  def create
  end

  def index
     @post_images = PostImage.all
  end

  def show
  end

  def destroy
  end
end
