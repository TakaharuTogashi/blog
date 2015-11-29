100.times do |i|
  Article.create!(
    title: "タイトル#{i + 1}",
    text: "#{i + 1}個目の記事です。",
  )
end
