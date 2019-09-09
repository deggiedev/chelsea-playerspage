class PlayersController < ApplicationController
        
    def index
        players = Player.all
        render json: players, include: [:name, :age, :position], except: [:active, :updated_at, :created_at]
    end
    
    def show
        player = Player.find_by(id: params[:id])
        render json: player, include: [:name, :age, :position], except: [:active, :updated_at, :created_at]
    end 

    def create
        player = Player.new(player_params)
    
        if player.save
          render json: player, status: :created
        else
          render json: player.errors, status: :unprocessable_entity
        end
    end
    
    def update
        if player.update(player_params)
          render json: player
        else
          render json: player.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        player.destroy
        if player.destroy
          head :no_content, status: :ok
        else
          render json: player.errors, status: :unprocessable_entity
        end      
    end
    
      private
    def set_list
        player = Player.find(params[:id])
    end
       
    def player_params
         params.require(:player).permit(:name, :age, :position)
    end
    
end
