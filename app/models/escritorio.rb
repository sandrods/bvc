class Escritorio < ActiveRecord::Base
	belongs_to :cidade
	has_and_belongs_to_many :areas
	has_and_belongs_to_many :classes, :class_name=> 'Classe'
	
	def validate
		if classes.empty?
			errors.add_to_base("Selecionar pelo menos uma classe")
		end
	end


	validates_presence_of :nome, :endereco, :cnpj, :fone1, :message=> 'deve ser preenchido'


end
