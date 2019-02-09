module ApplicationHelper

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end

=begin
if a || bの時　aに中身が入っているときは、aを読み込み始める段階でtrueを返す。
しかし、aに中身が存在しな場合そのままbを読み込みそこで再度中身が存在するか否かを判断して結果を返す。
上記を前提に以下を解説する。
currente_userはDBにid検索をかけるメソッド。
HTTPは、ページを更新するごとに全てリセットしてしまうので、これで常にログイン中のユーザの情報を確認している。
仮に
  @current_user = User.find_by(id: session[:user_id])
  だった場合、DBに確認をしないといけないが
  @current_user ||= User.find_by(id: session[:user_id])
の場合、一度DBに確認すると@current_user（インスタンス変数）の特性で譲歩を保持し続けられるので
処理が早くなる。（DBに負荷がかからないようにするため）

DBは一個のアプリ。通信は少ない方がいい。
=end

  # def logged_in?
  #   !current_user.nil?
  #   #!(1==0)->true
  # end

=begin
Rubyはtrue
Rubyはfalseとnil以外は全てtrue
＊Cみたいな古典的な言語だと、1=true,0=false

if a ||(or) b
=end
end
