# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_15_183320) do

  create_table "historicos", force: :cascade do |t|
    t.integer "pedido_id"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_historicos_on_pedido_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.integer "tempo_preparo"
    t.text "ingredientes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "restaurante_id"
    t.integer "item_id"
    t.integer "status_pedido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_pedidos_on_item_id"
    t.index ["restaurante_id"], name: "index_pedidos_on_restaurante_id"
  end

  create_table "restaurantes", force: :cascade do |t|
    t.string "nome"
    t.string "nome_fantasia"
    t.string "cnpj"
    t.date "hora_abertura"
    t.date "hora_fechamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
