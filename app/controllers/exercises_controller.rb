class ExercisesController < ApplicationController
  def home
    @exercises = Exercise.all
    @workouts = Workout.all
    @tags = Tag.all
    render('/layouts/home.html.erb')
  end

  def index
    @exercises = Exercise.all
    render('index.html.erb')
  end

  def show
    @exercise = Exercise.find_by(slug: params[:slug])
    @tags = @exercise.tags
    @movements = @exercise.movements
    @workouts = []
    @movements.each do |movement|
      @workouts << movement.workout
    end
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
    @existing_tags.each do |tag|
      @exercise.tags.delete(tag)
    end

    @selected_tags = params[:tags].split(',')
    @selected_tags.each do |tag|
      @exercise.tags << Tag.find(tag.to_i)
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
