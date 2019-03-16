# frozen_string_literal: true

class PostForm
  attr_reader :post

  def initialize(params)
    @image = params[:image]
    params.delete(:image)
    @post = Post.new(params)
  end

  def save
    if @post.valid? && save_image
      @post.save!
    end
  end

  private

  def save_image
    url = FtpImage.new(@image).save
    return @post.errors.add(:image, 'can\'t save file') unless url

    @post.image_url = url
  end
end
