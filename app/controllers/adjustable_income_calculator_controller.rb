class AdjustableIncomeCalculatorController < ApplicationController
  layout 'guides'

  def show
    @pot = params[:pot]
    @age = params[:age]

    calculator = AdjustableIncomeCalculator.new(@pot.to_f, @age.to_i)
    @tax_free_lump_sum = calculator.tax_free_lump_sum
    @ending_age = AdjustableIncomeCalculator::LIFE_EXPECTANCY

    @adjustment = params[:adjustment]
    @age_adjustment = params[:age_adjustment]
    @income_adjustment = params[:income_adjustment]

    case @adjustment
    when 'income'
      @income = @income_adjustment
      @ending_age = calculator.ending_age_for(@income_adjustment.to_f)
    when 'age'
      @ending_age = @age_adjustment
      @income = calculator.income_until(@age_adjustment.to_i)
    else
      @income = calculator.income
    end
  end
end
