class ItemsController < ApplicationController
  class ItemsController < ApplicationController
    def index
      # ここにindexアクションのロジックを記述
      params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
    end
  end
  
end
