names = %w(劇団四季 ぱんだ劇団 こども劇団 あいう劇団 どれみ劇団 歌舞伎げんじ)#全角空白気を付ける
login_names = %w(Shiki Panda Kodomo Aiueo Doremi Genji)
password = "actor"

0.upto(5) do |idx|
  Actor.create(
    name: names[idx],
    login_name: login_names[idx],
    password: password,
    password_confirmation: password
  )
end
