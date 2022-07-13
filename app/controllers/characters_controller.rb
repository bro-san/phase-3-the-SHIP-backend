class CharactersController < ApplicationController
  
    get "/characters" do 
      # if params.include?("include_ships")
      #   Character1.includes(:ships).to_json(get_character_json_config(
      #     include_ships: true
      #   ))
      # else
        Character2.all.to_json #(get_character_json_config)
      # end
    end
  
    get "/characters/:id" do 
      find_character 
      @character.to_json #(get_character_json_config(
      #   include_ships: true
      # ))
    end
    
    post "/characters"do 
      character1 = Character1.create(character_params)
      character1.to_json
      character2 = Character2.create(character_params)
      character2.to_json
      puts "Added to the crew!"
    end

    # post "/characters"do 
    #   character1 = Character1.create(name: params[:name], gender: params[:gender], description: params[:description], imageURL: params[:imageURL], anime_name: params[:anime_name], anime_imageURL: params[:anime_imageURL])
    #   character1.to_json
    #   character2 = Character2.create(name: params[:name], gender: params[:gender], description: params[:description], imageURL: params[:imageURL], anime_name: params[:anime_name], anime_imageURL: params[:anime_imageURL])
    #   character2.to_json
    #   puts "Added to the crew!"
    # end
  
    # patch "/characters/:id" do 
    #   find_character
    #   @character.update(character_params)
    #   @character.to_json
    # end
      
    delete "/characters/:id" do 
      find_character
  
      @character.destroy
      # status 204 # this was a successful request
    end
  
    private 
  
    def find_character 
      @character = Character1.find(params[:id])
    end
  
    # def get_character_json_config(include_ships: false)
    #   options = { methods: [:gender] }
    #   if include_ships
    #     options.merge!({
    #       include: {
    #         ships: {
    #           methods: [:formatted_time]
    #         }
    #       }
    #     })
    #   end
    #   options
    # end
  
    def character_params
      allowed_params = %w(name gender description imageURL anime_name anime_imageURL)
      params.select { |k,v| allowed_params.include?(k) }
    end
  
  end