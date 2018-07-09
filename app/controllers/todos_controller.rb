class TodosController < ApplicationController
  before_action :list
  before_action :todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = @list.todos
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = @list.todos.new(todo_params)
    if @todo.save
      flash[:success] = "To Do item with name #{@todo.name} created!"
      redirect_to list_todo_path(@list, @todo)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:success] = "To Do item with name: #{@todo.name} updated!"
      redirect_to list_todo_path(@list, @todo)
    else
      render :edit
    end
  end

  def destroy
    name = @todo.name
    @todo.destroy
    flash[:success] = "To do item with name #{name} destroyed!"
    redirect_to list_todos_path(@list)
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :content, :author)
  end

  def todo
    @todo = @list.todos.find(params[:id])
  end

  def list
    @list = List.find(params[:id])
  end
end
