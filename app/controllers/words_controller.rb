# frozen_string_literal: true

# Words controller
class WordsController < ApplicationController
  def index
    limit = (word_params[:limit] || 10).to_i
    swear = word_params[:swear] == 'true'

    # puts "#{limit}, #{swear}"
    @random_words = Word.random(limit, swear: swear)

    respond_to do |format|
      format.json { render json: @random_words }
      format.html
    end
  end

  def swears
    limit = (word_params[:limit] || 10).to_i
    @random_words = Word.swears(limit)

    respond_to do |format|
      format.json { render json: @random_words }
      format.html
    end
  end

  private

  def word_params
    params.permit(:limit, :swear, :format)
  end

  def params?
    params.key?(:limit) || params.key?(:swear)
  end
end
