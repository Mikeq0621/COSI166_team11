class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
        #@listings_names 
    end

    def new

    end

    def create

    end

    def destroy
        
    end
end
