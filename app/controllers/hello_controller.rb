class HelloController < ApplicationController
  def index
    # データベースから最初のメッセージを取得 型をつける
    @message = Message.first
  end
end
