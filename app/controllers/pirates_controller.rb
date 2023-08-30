require 'byebug'
class PiratesController < ApplicationController
  before_action :authorize_request, only: [:get_pirates]
  def index
    puts 'reading params', params
    if params[:query]

      @pirates = Pirate.where('name LIKE ?', '%' + params[:query] + '%')
      puts 'showing pirates'
    else
      puts 'no query'
      @pirates = Pirate.all.order(bounty: :desc)
    end

    def new
      @pirate = Pirate.new
      @crews = Crew.all
    end
  end

  def show
    @pirate = Pirate.find(params[:id])
    puts "showing #{@pirate.name}"
  end

  def create
    @pirate = Pirate.new
    @pirate.name = params[:pirate][:name]
    @pirate.position = params[:pirate][:position]
    @pirate.bounty = params[:pirate][:bounty]
    @pirate.crew_id = params[:crew_id]
    @pirate.image.attach(params[:pirate][:image])
    puts 'show crew', @pirate.crew_id
    if @pirate.save
      puts 'saved'
      redirect_to action: 'index'
    else
      puts @pirate.errors.full_messages
      flash[:notice] = @pirate.errors.full_messages.join(" \n")

      render 'new'
    end
  end

  def new_bounty
    @pirate = Pirate.find(params[:id])

    def update_bounty
      @pirate = Pirate.find(params[:id])
      @pirate.change_bounty(params[:bounty])
      if @pirate.save
        puts 'saved'
        redirect_to action: 'index'
      else
        puts @pirate.errors.full_messages
        flash[:notice] = @pirate.errors.full_messages.join(" \n")

        render 'new_bounty'
      end
    end
  end

  def csv_export
    require 'csv'
    file = "#{Rails.root}/public/pirate_data.csv"
    pirates = Pirate.all
    headers = %w[Name Position Bounty]
    CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
      pirates.each do |pirate|
        writer << [pirate.name, pirate.position, pirate.bounty]
      end
    end
    send_file file, type: 'text/csv', x_sendfile: true
  end

  def import
    Pirate.import(params[:file])
    redirect_to action: 'index'
  end

  def get_csv; end

  # Apiiiii----------------------------------------------------------------------------------------------------------------

  def test1
    @p = Pirate.last
    puts @p.name
  end

  def test
    @pirate = Pirate.last
  end

  def get_pirates
    puts 'pirates called'
    puts "responding to api call \n"
    @pirates = Pirate.all
  end

  def get_pirate
    @base_url = "#{request.host}:#{request.port}"
    begin
      @pirate = Pirate.find(params[:id])
    rescue StandardError
      render json: { message: 'no pirate with that id found' }
    end
  end

  private

  def pirate_params
    params.require(:pirate).permit(:name, :bounty, :position, :crew_id, :image)
  end
end
