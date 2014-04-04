class TagsController < ApplicationController

  def index
    @tags = Tag.all
    render('index.html.erb')
  end

  def show
    @tag = Tag.find_by(slug: params[:slug])
    @exercises = @tag.exercises
    render('show.html.erb')
  end

  def new
    @tag = Tag.new
    render('new.html.erb')
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to('/tags')
    else
      render('edit.html.erb')
    end
  end

  def edit
    @tag = Tag.find_by(slug: params[:slug])
    render('tags/edit.html.erb')
  end

  def update
    @tag = Tag.find_by(slug: params[:slug])
    if @tag.update(params[:tag])
      flash[:notice] = "This has been updated"
      redirect_to "/tags/#{@tag.slug}"
    else
      render "tags/edit.html.erb"
    end
  end

  def destroy
    @tag = Tag.find_by(slug: params[:slug])
    @tag.destroy
    redirect_to('/tags')
  end

end
