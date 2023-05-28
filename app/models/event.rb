class Event < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: 'サッカー' }, { id: 3, name: '野球' },
    { id: 4, name: 'バスケットボール' }, { id: 5, name: 'バレーボール' }, { id: 6, name: 'テニス' },
    { id: 7, name: '卓球' }, { id: 8, name: 'ゴルフ' }, { id: 9, name: 'ラグビー' },
    { id: 10, name: 'ハンドボール' }, { id: 11, name: 'フットサル' }, { id: 12, name: '水泳' },
    { id: 13, name: 'ダイビング' }, { id: 14, name: 'サーフィン' }, { id: 15, name: 'バドミントン' },
    { id: 16, name: 'ボウリング' }, { id: 17, name: 'クライミング' }, { id: 18, name: 'ダンス' },
    { id: 19, name: 'ヨガ' }, { id: 20, name: '陸上競技' }, { id: 21, name: '格闘技' },
    { id: 22, name: '体操競技' }, { id: 23, name: '冬季スポーツ' }, { id: 24, name: 'サイクリング' },
    { id: 25, name: 'お話' }, { id: 26, name: '雑談' }, { id: 27, name: '暇つぶし' },
    { id: 28, name: '勉強' }, { id: 29, name: '読書' }, { id: 30, name: '映画鑑賞' },
    { id: 31, name: '音楽鑑賞' }, { id: 32, name: 'ゲーム' }, { id: 33, name: 'ボードゲーム' },
    { id: 34, name: 'リラクゼーション' }, { id: 35, name: '副業' }, { id: 36, name: 'その他' }
  ]
  def self.options
    self.all.reject{ |e| e.id == 1 }
  end
  include ActiveHash::Associations
  has_many :rooms
end