titles = %w[ロミオとジュリエット ライオンキング オペラ座の怪人 歌舞伎座]

1.upto(6) do |idx|
  actor = Actor.find(idx)
  category = Category.find(rand(1..5))
  status = [1,2,3]

  0.upto(2) do |idx|
    Stage.create!(
      date: "#{rand(2021..2024)}-#{rand(1..12)}-#{rand(1..29)}",
      title: titles[idx],
      time: rand(1..2),
      status: status[idx],
      text: "本文本文本文本文本文本文本文本文本文本文本文本文",
      actor_id: actor.id,
      category_id: category.id
    )
  end

end

