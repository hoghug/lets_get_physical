class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
    render('index.html.erb')
  end

  def show
    @exercise = Exercise.find_by(slug: params[:slug])
    @tags = @exercise.tags
    render('show.html.erb')
  end

  def new
    @exercise = Exercise.new
    @tags = Tag.all
    render('new.html.erb')
  end

  def create
    @exercise = Exercise.new(params[:exercise])
    @selected_tags = params[:tags].split(',')
    @selected_tags.each do |tag|
      @exercise.tags << Tag.find(tag.to_i)
    end

    if @exercise.save
      redirect_to('/exercises')
    else
      render('edit.html.erb')
    end
  end

  def edit
    @exercise = Exercise.find_by(slug: params[:slug])
    @exercise_tags = @exercise.tags
    @tags = Tag.all
    render('exercises/edit.html.erb')
  end

  def update
    @exercise = Exercise.find_by(slug: params[:slug])
    @existing_tags = @exercise.tags

    @selected_tags = params[:tags].split(',')
    @selected_tags.each do |tag|
      unless @existing_tags.include?(tag)
        @exercise.tags << Tag.find(tag.to_i)
      end
    end

    if @exercise.update(params[:exercise])
      flash[:notice] = "This has been updated"
      redirect_to "/exercises/#{@exercise.slug}"
    else
      render "exercises/edit.html.erb"
    end
  end

  def destroy
    @exercise = Exercise.find_by(slug: params[:slug])
    @exercise.destroy
    redirect_to('/exercises')
  end

end
