class CidadesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  def list
    @city_pages, @cidades = paginate :cidade, :per_page => 10
  end


  def show
    @cidade = Cidade.find(params[:id])
  end

  def new
    @cidade = Cidade.new
  end

  def create
    @cidade = Cidade.new(params[:cidade])
    if @cidade.save
      flash[:notice] = 'Cidade was successfully created.'
      redirect_to :action => 'list'
      session[:cidades]=nil
    else
      render :action => 'new'
    end
  end

  def edit
    @cidade = Cidade.find(params[:id])
  end

  def update
    @cidade = Cidade.find(params[:id])
    if @cidade.update_attributes(params[:city])
      flash[:notice] = 'Cidade was successfully updated.'
      redirect_to :action => 'show', :id => @cidade
    else
      render :action => 'edit'
    end
  end

  def destroy
    Cidade.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
