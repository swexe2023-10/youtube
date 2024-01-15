class VideosController < ApplicationController
    def index
        @videos = Video.all
        
    end
    
    def new
        @video = Video.new
    end
    
    def create
        if (params[:video][:title] == "")
            redirect_to videos_notitle_path
        else
            if (params[:video][:video] == nil)
                redirect_to videos_nofile_path
            else
                @video = Video.new(video_params)
                if @video.save
                    redirect_to @video
                else
                    redirect_to videos_error_path
                end
            end
        end
    end
    
    def show
        @video = Video.find(params[:id])
    end

    private

    def video_params
        params.require(:video).permit(:title, :introduction, :video)
    end
end
