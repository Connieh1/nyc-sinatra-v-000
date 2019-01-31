class FiguresController < ApplicationController

  get '/figures' do
      @figures = Figure.all
      erb :'figures/index'
    end

    get '/figures/new' do
      erb :'figures/new'
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'/figures/show'
    end

    get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      erb :'figures/edit'
    end

    post '/figures' do
      @figure = Figure.create(params['figure'])
      unless params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end

      unless params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end

      @figure.save
      redirect to "/figures/#{@figure.id}"
    end

    patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

    # patch '/figures/:id' do
    #
    #   @figure = Figure.find_or_create_by(params[:id])
    #   @figure.update(params[:figure])
    #   @figure.title = params[:figure][:title]
    #   # @song.update(params[:song])
    #   # @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    #   # @song.genre_ids = params[:genres]
    #   # @song.save
    #   unless params[:title][:name].empty?
    #     @figure.titles << Title.create(params[:title])
    #   end
    #   unless params[:landmark][:name].empty?
    #     @figure.landmarks << Landmark.create(params[:landmark])
    #   end
    #   @figure.save
    #   redirect to "/figures/#{@figure.id}"
    # end
  end



#   get '/figures' do
#     @figures = Figure.all
#     erb :'figures/index'
#   end
#
#   get '/figures/new' do
#     erb :'figures/new'
#   end
#
#   # post '/figures' do
#   #   @figure = Figure.create(params[:figure])
#   #   if params[:landmark][:name]
#   #     @figure.landmarks << Landmark.create(params[:landmark])
#   #   end
#   #   if params[:title][:name]
#   #     @figure.titles << Title.create(params[:title])
#   #   end
#   #   @figure.save
#   #
#   #   redirect "/figures/#{@figure.id}"
#   # end
#
#   get '/figures/:id' do
#     @figure = Figure.find(params[:id])
#     erb "/figures/show"
#   end
#
#   get '/figures/:id/edit' do
#     @figure = Figure.find(params[:id])
#     erb :'/figures/edit'
#   end
#
#   # patch '/figures' do
#   #   @figure = Figure.find(params[:id])
#   #   @figure.update(params[:figure])
#   #   if params[:title][:name]
#   #     @figure.titles << Title.create(params[:title])
#   #   end
#   #   if params[:landmark][:name]
#   #     @figure.landmarks << Landmark.create(params[:landmark])
#   #   end
#   #   @figure.save
#   #
#   #   redirect "/figures/#{@figure.id}"
#   # end
#
#   post '/figures' do
#     @figure = Figure.create(params[:figure])
#     @figure.title = Title.find_or_create(params[:figure][:title_ids])
#     # unless params[:landmark][:name].empty?
#     #   @figure.landmarks << Landmark.create(params[:landmark])
#     # end
#     #
#     # unless params[:title][:id].empty?
#     #   @figure.title.ids << Title.create(params[:id])
#     # end
#
#     @figure.save
#     redirect to "/figures/#{@figure.id}"
#   end
#
#   patch '/figures/:id' do
#     @figure = Figure.find_by_id(params[:id])
#     @figure.update(params[:figure])
#     unless params[:title][:name].empty?
#       @figure.titles << Title.create(params[:title])
#     end
#     unless params[:landmark][:name].empty?
#       @figure.landmarks << Landmark.create(params[:landmark])
#     end
#     @figure.save
#     redirect to "/figures/#{@figure.id}"
#   end
# end
