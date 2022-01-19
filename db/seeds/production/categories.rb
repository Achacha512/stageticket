names = %w(恋愛系 ファンタジー お笑い系 ミュージカル オペラ)

0.upto(4) do |idx|
  Category.create(
    name: names[idx]
  )
end