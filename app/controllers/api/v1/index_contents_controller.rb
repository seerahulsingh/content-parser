module Api::V1
  class IndexContentsController < ApiController

    def index
      render json: { data: Page.all.as_json(include: [:contents]) }, status: :ok
    end

    def create
      url = params[:url]

      page = Page.new(url: url)
      if page.save
        page_id = page.id
        contents = Parser.new(url).get_contents

        contents = contents.map do |c|
          c[:page_id] = page_id
          Content.new(c)
        end

        Content.import contents

        render json: { message: "Successfully parsed content", data: page.as_json(include: [:contents])}, status: :ok
      else
        render json: { message: "Validation Errors", errors: page.errors.full_messages }
      end
    end
  end
end
