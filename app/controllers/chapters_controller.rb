class ChaptersController < ApplicationController
  before_action :find_novel
  before_action :find_chapter, only: [:show]

  def show
  end

  def voting
    @chapters = @novel.chapters.where(chapter_num: params[:id])
  end

  private

  def find_novel
    @novel = Novel.friendly.find(params[:novel_id])
  end

  def find_chapter
    @chapter = @novel.chapters.find(params[:id])
  end
end