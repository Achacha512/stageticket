names = %w(劇団四季 ぱんだ劇団 こども劇団 あいう劇団 )#全角空白気を付ける
login_names = %w(Shiki Panda Kodomo Aiu)
password = "actor"

0.upto(3) do |idx|
  User.create(
    name: names[idx],
    login_name: login_names[idx],
    password: password,
    password_confirmation: password
  )
end
