class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
        #@listings_names 
    end
end
