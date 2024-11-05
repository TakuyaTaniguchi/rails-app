class HelloController < ApplicationController
  def index
    # データベースから最初のメッセージを取得
    @message = Message.first
  end
end
