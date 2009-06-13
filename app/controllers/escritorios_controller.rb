class EscritoriosController < ApplicationController

	def index
		redirect_to :action => 'list'
	end

	def list
		@escris = Escritorio.find(:all, :order => "escritorios.nome", :include => :cidade)
	end

	def edit
		session[:cidades] = Cidade.find(:all, :order => "nome") if session[:cidades]==nil
		session[:areas] = Area.find :all, :order=>'nome' 
		session[:classes] = Classe.find :all, :order=>'nome' 

		session[:escritorio_id] = params[:id]

		@escritorio = Escritorio.find(params[:id])

		render :layout=>'edit'
	end

	def new
		@escritorio = Escritorio.new
		@cidades = Cidade.find(:all, :order => "nome") 
	end

  def create
    @escritorio = Escritorio.new(params[:escritorio])
    if @escritorio.save
      redirect_to :action => 'search'
    else
      render :action => 'new'
    end
  end

  def update
    @escritorio = Escritorio.find(params[:id])
    
    params[:escritorio][:area_ids]=[] unless params[:escritorio][:area_ids]
		params[:escritorio][:class_ids]=[] unless params[:escritorio][:class_ids]

    if @escritorio.update_attributes(params[:escritorio])
      flash[:notice] = 'Escritorio was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Escritorio.find(params[:id]).destroy
    redirect_to :action => 'search'
  end

  def list_search

    sql  = "SELECT e.* FROM `escritorios` e"

    sql += " where 1=1"

    sql += " and cidade_id=" + params[:pesq][:cidade_id] if params[:pesq][:cidade_id]!=""
    sql += " and uf='" + params[:pesq][:uf] + "'" if params[:pesq][:uf]!=""
    sql += " and nome like '%" + params[:pesq][:nome]+"%' " if params[:pesq][:nome]!=""

    if params[:pesq][:area]!=""
        sql += " and e.id in(select escritorio_id from areas_escritorios ae where ae.area_id=#{params[:pesq][:area]})"
    end

    if params[:pesq][:class_ids]
      params[:pesq][:class_ids].collect do |area|
        sql += " and e.id in(select escritorio_id from classes_escritorios ce where ce.classe_id=#{area})"
      end
    end

    sql = sql + " order by nome"

    @escris = Escritorio.find_by_sql sql
    render :action=>'list'
  end
  
  def search
	session[:cidades] = Cidade.find(:all, :order => "nome") unless session[:cidades]
	session[:areas] = Area.find :all, :order=>'nome' unless session[:areas]
	session[:classes] = Classe.find :all, :order=>'nome'unless session[:classes]
  end
end
