class AdvogadosController < ApplicationController

  layout 'edit', :only => :list

  def list
    @advs = Advogado.find :all, :conditions => ['escritorio_id=?', params[:id]]
  end

  def update
    @advogado = Advogado.find(params[:id])
    if @advogado.update_attributes(params[:advogado])
      flash['notice_'+@advogado.id.to_s] = 'Salvo com sucesso.'
    else
      flash['notice_'+@advogado.id.to_s] = 'Preencher campos obrigatórios.'
    end
    render :partial => 'adv', :object => @advogado, :layout=> false
  end

  def new
    @advogado = Advogado.new
    @advogado.escritorio_id = session[:escritorio_id]

    render :partial => 'new', :object => @advogado, :layout=> false
  end

  def create
    @advogado = Advogado.new(params[:advogado])
    if @advogado.save
      flash['notice_'+@advogado.id.to_s] = 'Criado com sucesso.'
      render :partial => 'adv', :object => @advogado, :layout=> false
    else
	    flash['notice'] = 'Preencher campos obrigatórios.'
      render :partial => 'new', :object => @advogado, :layout=> false
    end
  end
  
  def delete
    Advogado.find(params[:id]).destroy
    render :nothing => true
  end
end
