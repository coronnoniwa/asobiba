class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, name: '---', weather_id: "000000" }, { id: 2, name: '北海道', weather_id: "016010" }, { id: 3, name: '青森県', weather_id: "020010" },
    { id: 4, name: '岩手県', weather_id: "030010" }, { id: 5, name: '宮城県', weather_id: "040010" }, { id: 6, name: '秋田県', weather_id: "050010" },
    { id: 7, name: '山形県', weather_id: "060010" }, { id: 8, name: '福島県', weather_id: "070010" }, { id: 9, name: '茨城県', weather_id: "080010" },
    { id: 10, name: '栃木県', weather_id: "090010" }, { id: 11, name: '群馬県', weather_id: "100010" }, { id: 12, name: '埼玉県', weather_id: "110010" },
    { id: 13, name: '千葉県', weather_id: "120010" }, { id: 14, name: '東京都', weather_id: "130010" }, { id: 15, name: '神奈川県', weather_id: "140010" },
    { id: 16, name: '新潟県', weather_id: "150010" }, { id: 17, name: '富山県', weather_id: "160010" }, { id: 18, name: '石川県', weather_id: "170010" },
    { id: 19, name: '福井県', weather_id: "180010" }, { id: 20, name: '山梨県', weather_id: "190010" }, { id: 21, name: '長野県', weather_id: "200010" },
    { id: 22, name: '岐阜県', weather_id: "210010" }, { id: 23, name: '静岡県', weather_id: "220010" }, { id: 24, name: '愛知県', weather_id: "230010" },
    { id: 25, name: '三重県', weather_id: "240010" }, { id: 26, name: '滋賀県', weather_id: "250010" }, { id: 27, name: '京都府', weather_id: "260010" },
    { id: 28, name: '大阪府', weather_id: "270000" }, { id: 29, name: '兵庫県', weather_id: "280010" }, { id: 30, name: '奈良県', weather_id: "290010" },
    { id: 31, name: '和歌山県', weather_id: "300010" }, { id: 32, name: '鳥取県', weather_id: "310010" }, { id: 33, name: '島根県', weather_id: "320010" },
    { id: 34, name: '岡山県', weather_id: "330010" }, { id: 35, name: '広島県', weather_id: "340010" }, { id: 36, name: '山口県', weather_id: "350020" },
    { id: 37, name: '徳島県', weather_id: "360010" }, { id: 38, name: '香川県', weather_id: "370000" }, { id: 39, name: '愛媛県', weather_id: "380010" },
    { id: 40, name: '高知県', weather_id: "390010" }, { id: 41, name: '福岡県', weather_id: "400010" }, { id: 42, name: '佐賀県', weather_id: "410010" },
    { id: 43, name: '長崎県', weather_id: "420010" }, { id: 44, name: '熊本県', weather_id: "430010" }, { id: 45, name: '大分県', weather_id: "440010" },
    { id: 46, name: '宮崎県', weather_id: "450010" }, { id: 47, name: '鹿児島県', weather_id: "460010" }, { id: 48, name: '沖縄県', weather_id: "470010" },
    { id: 49, name: 'オンライン', weather_id: "000000" },
  ]
  def self.options
    self.all.reject{ |e| e.id == 1 }
  end
  include ActiveHash::Associations
  has_many :facilities
end