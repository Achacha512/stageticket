names = %w(本田圭佑 鈴木太郎 谷晃生 内田篤人 柴崎岳)#全角空白気を付ける
login_names = %w(Kei Taro Kou Atu Gaku)
password = "stage"

0.upto(4) do |idx|
  User.create!(
    name: names[idx],
    login_name: login_names[idx],
    password: password,
    password_confirmation: password
  )
end
