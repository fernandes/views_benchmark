class RenderController < ApplicationController
  def rails
  end

  def cells
    trbrender(View)
  end

  def mixed
  end

  private
    def trbrender(cell_constant, model = nil, options: {}, rails_options: {})
      render(
        {
          html: cell(
            cell_constant,
            model,
            {
              layout: Layout,
            }
          )
        }
      )
    end
end
