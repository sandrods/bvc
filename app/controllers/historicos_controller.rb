class HistoricosController < ApplicationController
  
 layout 'edit', :only => :list

  def list
    @hists = Historico.find :all, 
                            :conditions => ['escritorio_id=?', params[:id]],
                            :order => 'data DESC'
  end

  def update
    @historico = Historico.find(params[:id])

    if @historico.update_attributes(params[:historico])
      flash['notice_'+@historico.id.to_s] = 'Salvo com sucesso.'
      render :partial => 'historico', :object => @historico, :layout=> false
    else
      render :action => 'edit'
    end
  end

  def new
    @historico = Historico.new
    @historico.escritorio_id = session[:escritorio_id]

    render :partial => 'new', :object => @historico, :layout=> false
  end

  def create
    @historico = Historico.new(params[:historico])
    if @historico.save
      flash['notice_'+@historico.id.to_s] = 'Criado com sucesso.'
      render :partial => 'historico', :object => @historico, :layout=> false
    else
      render :action => 'new'
    end
  end
  
  def delete
    Historico.find(params[:id]).destroy
    render :nothing => true
  end

end
