class StaticPagesController < ActionController::Base
    # want this controller to serve HTML

    def frontend
        render file: Rails.root.join('public', 'index.html')
    end
end