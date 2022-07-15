class ShipsController < ApplicationController

  # get "/ships" do
  #   Ship.all.to_json #(get_ship_json_config)
  # end

  get "/ships" do
    params.include?("include_comments") ? Ship.includes(:comments).to_json(get_ship_json_config(include_comments: true)) : Ship.all.to_json(get_ship_json_config)
  end

  get "/ships/:id" do
    find_ship
    @ship.to_json
  end

  post "/ships" do
    ship = Ship.create(name: params[:name], character1_id: params[:character1_id], character2_id: params[:character2_id])
    ship.to_json
  end

  patch "/ships/:id" do
    find_ship
    @ship.update(name: params[:name], character1_id: params[:character1_id], character2_id: params[:character2_id])
    @ship.to_json
  end

  delete "/ships/:id" do
    find_ship
    @ship.destroy
    @ship.to_json
  end


  private

    def find_ship
        @ship = Ship.find(params[:id])
    end

    # def ship_params   <- doesn't seem to work?
    #   params.permit(:character1_id, :character2_id, :name)
    # end

    def get_ship_json_config(include_comments: false)
      if include_comments
        options = { methods: :comment_list }
      end
      options
    end
  end