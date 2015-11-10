class ExpensesController < ApplicationController 
    helper_method :sort_column, :sort_direction
    before_action :authenticate_user!
    before_action :find_expense, only: [:show, :edit, :update, :destroy]
    
    def index
        @expenses = User.find(current_user).expenses.all.order(sort_column + " " + sort_direction)
        @num_categories = Expense.uniq.pluck(:category)
        @spent = Expense.pluck(:cost)
    end

    def show
    end
    
    def new
        @expense = Expense.new
    end
    
    def edit
    end
    
    def create
        @expense = User.find(current_user).expenses.create(expense_params)
        @expense.user = current_user
        if @expense.save
            redirect_to @expense
        else
            render "new"
        end
    end
    
    def update
        if @expense.update(expense_params)
            redirect_to @expense
        else
            render "edit"
        end
    end
    
    def destroy
        @expense.destroy
        redirect_to expenses_path
    end

    private
    def expense_params
        params.require(:expense).permit(:item, :cost, :date, :category, :comments)
    end
    
    def find_expense
         @expense = Expense.find(params[:id])
    end

    def sort_column
        Expense.column_names.include?(params[:sort]) ? params[:sort] : "date"
    end
  
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
end
