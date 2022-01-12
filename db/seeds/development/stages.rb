titles = %w[ロミオとジュリエット ライオンキング オペラ座の怪人 歌舞伎座]

1.upto(6) do |idx|
  actor = Actor.find(idx)
  category = Category.find(rand(1..5))

  0.upto(1) do |idx|
    Stage.create(
      date: "#{rand(2021..2024)}-#{rand(1..12)}-#{rand(1..29)}",
      title: titles[idx],
      time: rand(1..2),
      status: rand(1..3),
      text: "本文本文本文本文本文本文本文本文本文本文本文本文",
      actor_id: actor,
      category_id: category
    )
  end

end

