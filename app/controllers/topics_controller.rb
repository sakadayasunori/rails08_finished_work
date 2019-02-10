class TopicsController < ApplicationController

  def index
    # これはindex.htmlのindexと同義？
    @topics = Topic.all.includes(:favorite_users)
    @comment_topics = current_user.comment_topics

  end

    # all →　テーブルからすべてのレコードを取得する
    # 使い方：モデル.all
    #
    # .includes →関連するテーブルの内容を全て取得する。
    # 使い方：モデル.includes(条件)
    #
    # :favorite_users →テーブル
    #
    # @topicsの意味：favorite_users というテーブルの内容と、その中のレコードを全て取得する。これ自体をTopicとする。

  def new
    @topic = Topic.new
  end
  # インスタンス変数はviewでも使えるようになっている。というか使えるようにするためにやってる。
  # 　Topicモデルをここで作っている。（空箱）

  # ＊投稿ボタンを押すと以下のcreateのURLが作られ以下のめっソドが呼ばれる。
  def create
    @topic = current_user.topics.new(topic_params)
    # Userクラスでtopicsは定義されている。
    # Userクラスのtopicsパラメータにアクセスしている
        # newの引数にtopic_paramsを入れてtopicsに渡している。
    # インスタンス変数はviewでも使えるようになっている。
    # new
    # :モデルオブジェクトを生成する。
    # 保存はまだされていないため、saveメソッドなどを使って保存する。
    # 生成と同時に保存したい場合は、createメソッドを使用する
    #
    # sessionの部分で、セッション情報からcurrent_userをセットして、今のセッションの情報に入っているUserをCurrentUserとするというのが、基本的な使い方である。
    #


    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger]
      render :new
    end
   end


  private
  def topic_params
    params.require(:topic).permit(:image, :description)
    # topicのなかのimageとdixcriotionのみを受け取ることを許可している
    # 例）
    # params.require(:user).permit(:name, :email, :password)
    #
    # ①requireでPOSTで受け取る値のキーを設定
    # ②permitで許可するカラムを設定
    # ここではname, email, password属性の値だけDBに入れるのを許可

    # よって今回は、topicsのindex.htmlのフォームの中身（imageとdescription）が格納される
  end



end
