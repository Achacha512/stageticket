stages = Stage.where(status: 2)
1.upto(5) do |idx|
  stage = stages[idx]
  user = User.find(idx)

  0.upto(2) do
    Reservation.create(
      user_id: user.id,
      stage_id: stage.id
    )

  end
end