class TestsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:show, :edit, :update]

    def index
    end

    def show
        user = User.find(params[:id])
        @tests = Test.where(user_id: user.id)
        @test = Test.new
    end

    def new
        @test = Test.new
    end

    def create
        @test = current_user.tests.new(test_params)
        if @test.save
            redirect_to test_path(@test.user_id), notice: "テストを作成しました"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @test = Test.find(params[:id])
    end

    def update
        @test = Test.find(params[:id])
        if @test.update(test_params)
            redirect_to tests_path, notice: "テストを変更しました"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        test = Test.find(params[:id])
        test.destroy
        redirect_to tests_path, notice: "テストを削除しました"
    end

    private

    def test_params
        params.require(:test).permit(:title)
    end

    def ensure_correct_user
        @user = User.find(params[:id])
        unless @user == current_user
            redirect_to tests_path
        end
    end
end
