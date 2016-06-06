class Sku
  include Mongoid::Document
  field :i_id, type: String
  field :c_name, type: String
  field :name, type: String
  field :value, type: String
  field :unit, type: String
  field :p_id, type: Integer
  belongs_to :produsts
  has_one :products
  index({ i_id: 1},{ background: true })
  index({ p_id: 1}, { background: true })
  index({ c_name: 1}, { background: true })
scope :imma, -> {where(:c_name => 'IMAGE')}  
scope :att, -> {where(:c_name => 'Attributes')}
scope :glo, -> {where(:c_name => 'Global')}
scope :ex, -> {where(:c_name => 'Extra')}
scope :des, -> {where(:c_name => 'Description')}
scope :ht, -> {where(:c_name => 'HTML')}
scope :pd, ->{where(:c_name => 'PDF')}
scope :fb, -> {where(:name=>'Feature Bullet').pluck(:value)[0]}
scope :ml, -> {where(:name => 'Manufacturer Logo')}
scope :mn, -> {where(:name => 'Manufacturer Name')}
end
