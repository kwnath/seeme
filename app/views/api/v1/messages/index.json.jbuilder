json.array! @messages do |meeting|
  json.extract! meeting, :id, :content, :sender_id, :recipient_id
end
