class Rig < ApplicationRecord
  belongs_to :user
  validates :rig, presence: true, uniqueness: true

  # リグ選択
  # enum rig: {
    # ノーシンカーリグ:1, テキサスリグ:2, ライトテキサスリグ:3, キャロライナリグ:4, ヘビーキャロナイナリグ:5,
    # ライトキャロナイナリグ:6, ジグヘッドリグ:7, スプリットショットリグ:8, ダウンショットリグ:9, ネコリグ:10,
    # ワッキーリグ:11, ジカリグ:12, チェリーリグ:13, フリーリグ:14, フロートリグ:15
  # }

end
