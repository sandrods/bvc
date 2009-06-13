# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "advogados", :force => true do |t|
    t.string  "nome",          :limit => 60, :default => "", :null => false
    t.string  "oab",           :limit => 45
    t.string  "cpf",           :limit => 15
    t.string  "rg",            :limit => 15, :default => "", :null => false
    t.string  "celular",       :limit => 25
    t.string  "email",         :limit => 45
    t.integer "escritorio_id",               :default => 0,  :null => false
  end

  add_index "advogados", ["escritorio_id"], :name => "FK_advogados_1"

  create_table "areas", :force => true do |t|
    t.string "nome", :limit => 45, :default => "", :null => false
  end

  create_table "areas_escritorios", :id => false, :force => true do |t|
    t.integer "escritorio_id", :default => 0, :null => false
    t.integer "area_id",       :default => 0, :null => false
  end

  create_table "cidades", :force => true do |t|
    t.string "nome", :limit => 65, :default => "", :null => false
    t.string "uf",   :limit => 2,  :default => "", :null => false
  end

  create_table "classes", :force => true do |t|
    t.string "nome", :limit => 45, :default => "", :null => false
  end

  create_table "classes_escritorios", :id => false, :force => true do |t|
    t.integer "classe_id",                    :null => false
    t.integer "escritorio_id", :default => 0, :null => false
  end

  create_table "escritorios", :force => true do |t|
    t.string  "nome",          :limit => 60, :default => "", :null => false
    t.string  "oab",           :limit => 15
    t.string  "secao",         :limit => 20
    t.string  "endereco",      :limit => 45
    t.string  "bairro",        :limit => 45
    t.integer "cidade_id",                   :default => 0
    t.string  "cep",           :limit => 9
    t.string  "email",         :limit => 30
    t.string  "fone1",         :limit => 30
    t.string  "fone2",         :limit => 30
    t.string  "fax",           :limit => 20
    t.string  "site",          :limit => 45
    t.string  "secretaria",    :limit => 45
    t.string  "banco",         :limit => 20
    t.string  "agencia",       :limit => 12
    t.string  "cc",            :limit => 12
    t.string  "nominal",       :limit => 45
    t.text    "info"
    t.integer "avaliacao"
    t.string  "val_honor",     :limit => 45
    t.string  "val_audiencia", :limit => 45
    t.string  "val_pecas",     :limit => 45
    t.string  "val_outras",    :limit => 45
    t.string  "obs"
    t.string  "cnpj",          :limit => 20
    t.string  "uf",            :limit => 2
  end

  add_index "escritorios", ["cidade_id"], :name => "FK_cidades_1"
  add_index "escritorios", ["nome"], :name => "NOME_IDX"

  create_table "historicos", :force => true do |t|
    t.datetime "data"
    t.string   "descr",         :default => "", :null => false
    t.integer  "escritorio_id", :default => 0,  :null => false
  end

  add_index "historicos", ["escritorio_id"], :name => "FK_historicos_1"

end
