1.upto(18) do |idx|
  stage = Stage.find(idx)

  1.upto(6) do |idx|
    Seat.create!(
      stage_id: stage.id,
      seat_type: "S#{idx}",
      seat_price: 10000
    )
  end
  1.upto(12) do |idx|
    Seat.create!(
      stage_id: stage.id,
      seat_type: "A#{idx}",
      seat_price: 7000
    )
  end
  1.upto(12) do |idx|
  Seat.create!(
    stage_id: stage.id,
    seat_type: "B#{idx}",
    seat_price: 5000
  )
  end
end

# 1.upto(15) do |idx|
#   seat = Seat.find(rand(1..540))
#   reservation = Reservation.find(idx)
#   seat.update!(
#     reservation_id: reservation.id
#   )
# end

