class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
# userがいいねしたtopicsのことをfavorite_topicsと定義します。これはTopicモデルのhas_manyで定義されている。
# ログインしているユーザーがいいねしたトピックのみをtopicsテーブルから持ってくる。

  def create
    favorite = Favorite.new
    favorite.user_id =current_user.id
    favorite.topic_id = params[:topic_id]
  # favorite.topics_id = params[:topics_id]
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りの登録に失敗しました'
    end
  end

  def destroy
    favorite = Favorite.where(topic_id: params[:topic_id], user_id: current_user.id).first
   # favorite = Favorite.where(:user_id, :topic_id)
   # この書き方だとどのuser_idか、どのtopic_idなのか指定されていないのでわからない

    favorite.destroy

    if favorite.destroy
      redirect_to topics_path, success: 'お気に入りを削除しました。'
    else
      redirect_to topics_path, danger: 'お気に入りの削除に失敗しました'
    end
  end

end
