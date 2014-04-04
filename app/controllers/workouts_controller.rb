class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
    render('index.html.erb')
  end

  def show
    @workout = Workout.find_by(slug: params[:slug])
    @movements = @workout.movements.find(:all, :order => 'number')
    @tags = []
    render('show.html.erb')
  end

  def new
    @workout = Workout.new
    @exercises = Exercise.all
    render('new.html.erb')
  end

  def create
    @workout = Workout.new(params[:workout])
    @workout.save
    @movements = params[:movements].split(',')
    @movements.each do |move|
      parts = move.split('-')
      # @exercise = Exercise.find(parts[0].to_i)
      Movement.create({:exercise_id => parts[0].to_i, :workout_id => @workout.id, :number => parts[1].to_i, :reps => parts[2].to_i})
    end

    if @workout.save
      redirect_to('/workouts')
    else
      render('edit.html.erb')
    end
  end

  def edit
    @workout = Workout.find_by(slug: params[:slug])
    render('workouts/edit.html.erb')
  end

  def update
    @workout = Workout.find_by(slug: params[:slug])
    if @workout.update(params[:workout])
      flash[:notice] = "This has been updated"
      redirect_to "/workouts/#{@workout.slug}"
    else
      render "workouts/edit.html.erb"
    end
  end

  def destroy
    @workout = Workout.find_by(slug: params[:slug])
    @workout.destroy
    redirect_to('/workouts')
  end

end
