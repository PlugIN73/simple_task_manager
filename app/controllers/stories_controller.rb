class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.json
  def index
    q = params[:q]
    @stories = Story
    if q
      @stories = @stories.where(author_id: q[:author_id]) unless q[:author_id].blank?
      @stories = @stories.where(performer_id: q[:performer_id]) unless q[:performer_id].blank?
      @stories = @stories.where(state: q[:state]) unless q[:state].blank?
    end
    @stories = @stories.all

  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.includes(:story_comments).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end

  def change_state
    @story = Story.find(params[:story_id])
    if @story
      @story.fire_state_event(params[:event])
      @story.save
    end
    redirect_to stories_path
  end
end
