class SheetsController < ApplicationController
    def index
        @seats = Sheet.all.order(:row, :column)
      end
end
