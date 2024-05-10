class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all

    render({:template => "photo_templates/index"})
  end

  def show
    the_id = params.fetch("id")
    @photo = Photo.all.where({:id => the_id}).at(0)

    render({:template => "photo_templates/show"})
  end

  def destroy
    the_id = params.fetch("id")
    the_photo = Photo.all.where({:id => the_id}).at(0)
    the_photo.destroy

    redirect_to("/photos")
  end

  def create
    input = Photo.new
    input.caption = params.fetch("input_caption")
    input.comments_count = 0
    input.image = params.fetch("input_image")
    input.likes_count = 0
    input.owner_id = params.fetch("input_owner_id")

    input.save

    redirect_to("/photos/#{input.id}")
  end

  def comment
    input = Comment.new
    input.body = params.fetch("input_comment")
    input.author_id = params.fetch("input_author_id")
    input.photo_id = params.fetch("input_photo_id")
    input.save

    redirect_to("/photos/#{input.photo_id}")
  end

  def update
    the_id = params.fetch("id")
    photo = Photo.all.where({:id => the_id}).at(0)

    photo.caption = params.fetch("input_caption")
    photo.image = params.fetch("input_image")
    photo.save

    redirect_to("/photos/#{photo.id}")
  end
end
