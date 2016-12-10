class NovelsController < ApplicationController

  def index
    @contributing_novels = Novel.where(status: 0)
    @voting_novels = Novel.where(status: 1)
    @popular_tags = Tag.all
  end

  def show
    @novel = Novel.friendly.find(params[:id])
    @chapters = Chapter.where(novel_id: @novel.id, status: 'main')
  end

  def search
    @novels = Novel.search(params[:q])
  end
end
