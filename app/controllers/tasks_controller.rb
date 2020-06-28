class TasksController < ApplicationController
  def index
    @tasks = Task.all #タスク情報全てをindexへ表示
  end

  def show
    @task = Task.find(params[:id]) #各タスクに応じた情報をshowへ表示
  end

  def new
    @task = Task.new #タスク情報を入力するnewを表示
  end

  def create
    task = Task.new(task_params) #newで入力したタスクをテーブルへ保存する
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。" #登録後トップページへリダイレクト
  end

  def edit
    @task = Task.find(params[:id]) #各タスクに応じた情報をeditへ表示
  end

  def update
    task = Task.find(params[:id]) #editで編集した内容をテーブルへ保存する
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。" #編集完了後トップページへリダイレクト
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private
  
  def task_params #タスク内容のストロングパラメータ
    params.require(:task).permit(:name, :description)
  end
end
