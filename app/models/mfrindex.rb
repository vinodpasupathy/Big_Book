class Mfrindex
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  index({ i_id: 1},{ background: true })
  index({ p_id: 1}, { background: true })
  index({ m_name: 1}, { background: true })
  index({ mtax: 1}, { background: true })
  field :i_id, type: String
  field :m_name, type: String
  field :taxonomy, type: String
  field :mn_dummy, type: String
  field :mpn_dummy, type: String
  field :p_id, type: Integer
end
