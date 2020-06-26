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
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
