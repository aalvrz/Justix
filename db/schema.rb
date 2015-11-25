# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151125045149) do

  create_table "bufetes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "descripcion"
    t.integer  "user_id"
  end

  create_table "caso_personas", force: :cascade do |t|
    t.integer  "persona_id"
    t.integer  "caso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "casos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "num_accion"
    t.string   "accion"
    t.string   "materia"
    t.string   "oficina"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "descripcion"
    t.integer  "bufete_id"
    t.string   "estado",      default: "En Proceso"
  end

  create_table "personas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "num_registro"
    t.string   "apellido"
    t.date     "fecha_nacimiento"
    t.string   "telefono"
    t.string   "estado_civil"
    t.string   "email"
    t.string   "domicilio"
    t.string   "type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "bufete_id"
  end

  create_table "pruebas", force: :cascade do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.string   "archivo"
    t.integer  "caso_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "records", force: :cascade do |t|
    t.datetime "visita"
    t.string   "instancia"
    t.string   "folio"
    t.string   "actuacion"
    t.datetime "fecha_contraparte"
    t.string   "notificacion_cliente"
    t.text     "observaciones"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "caso_id"
    t.string   "notificacion_contraparte"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "admin",                  default: false
    t.string   "nombre"
    t.string   "apellido"
    t.string   "plan",                   default: "Prueba"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
