class NotesController < ApplicationController
  def index
    # データベースから最初のノートを取得
    @note = Note.first
  end
end
