class PostsController < ApplicationController
  def new
    # Viweへ渡すためのインスタンス変数に空のModelオプションを生成する
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    # ユーザーのIDを特定するための記述とログイン中のユーザーの情報を取得できる便利な記述
    @post.user_id = current_user.id
    if @post.save
      # リダイレクト先は投稿一覧画面（インスタなども投稿後は投稿一覧画面になっている
      redirect_to posts_path, notice: "You have created book successfully."
    else
      @posts = Post.all
      render 'new'
    end
  end

  def index
    # @postsにはpost_imagesテーブル内に存在する全てのレコードのインスタンスを代入します。
    #@posts = Post.all
    # distinct:trueは重複したデータを除外
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def show
    # レコードを１件取得するだけ。インスタンス変数名は単数形の「@post」
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end


  def destroy
    @post = Post.find(params[:id])
    # レコードの削除
    @post.destroy
    # 投稿一覧ページのパス
    redirect_to posts_path
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end



  private

  def post_params
    params.require(:post).permit(:image, :brand, :title, :body)
  end

end
