class ItemsController < ApplicationController
  class ItemsController < ApplicationController
    def index
      # ここにindexアクションのロジックを記述
    end
    def item_params
      params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
    end
  end
end
