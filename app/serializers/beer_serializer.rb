class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :brewery, :style
end
