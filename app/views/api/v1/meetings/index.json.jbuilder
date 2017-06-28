json.array! @meetings do |meeting|
  json.extract! meeting, :id, :status, :sender, :recipient
end
