json.array!(@tag_battles) do |tag_battle|
  json.extract! tag_battle, :id, :tag1_id, :tag2_id, :description
  json.url tag_battle_url(tag_battle, format: :json)
end
