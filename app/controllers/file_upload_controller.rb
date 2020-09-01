class FileUploadController < ApplicationController

  def create
    file = params[:file]
    if File.extname(file.path) == '.log'
      parsed_file = FileParseService.new(file).call
      render json: parsed_file
    else
      render json: { message: 'It is not a .log file' }, status: :bad_request
    end
  end
end
