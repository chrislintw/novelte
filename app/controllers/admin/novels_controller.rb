module Admin
  class NovelsController < AdminController
    before_action :find_novel, only: [:show, :edit, :update]
    def index
      @novels = Novel.all
    end

    def new
      @novel = Novel.new
    end

    def create
      @novel = Novel.new(novels_params)
      if @novel.save
        redirect_to admin_novels_path, notice: 'Novel was successfully created'
      else
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      if @novel.update_attributes(novels_params)
        redirect_to admin_novels_path, notice: 'Novel was successfully updated'
      else
        render :edit
      end
    end

    private

    def find_novel
      @novel = Novel.friendly.find(params[:id])
    end

    def novels_params
      params.require(:novel).permit(:title, :summay, :image, :chapters_number, category_ids: [])
    end
  end
end