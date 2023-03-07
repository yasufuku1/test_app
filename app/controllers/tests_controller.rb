class TestsController < ApplicationController
    before_action :authenticate_user!

    def index
        @tests = Test.all
    end

    def new
        @test = Test.new
    end

    def create
        @test = current_user.tests.new(test_params)
        if @test.save
            redirect_to tests_path, notice: "テストを作成しました"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def test_params
        params.require(:test).permit(:title)
    end
end
