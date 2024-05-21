class Api::V1::AccountsController < ApplicationController
  def index
    accounts = Account.all
    render json: accounts, status: 200
  end

  def show
    account = Account.find_by(id: params[:id])
    if account
      render json: account, status: 200
    else
      render json: {error: "Account not found"}, status: 404
    end
  end

  def create
    account = Account.new(
      fullName: arti_params[:fullName],
      vat: arti_params[:vat],
      city: arti_params[:city],
      zipcode: arti_params[:zipcode],
      address: arti_params[:address]
    )
    if account.save
      render json: account, status: 200
    else
      render json:{
        error:"Error creating account",
      }
    end
  end

  def update
    account = Account.find_by(id: params[:id])
    if account
      account.update(fullName: params[:fullName], vat: params[:vat], city: params[:city], zipcode: params[:zipcode], address: params[:address] )
      render json:  "Account updated Succesfully"
    else
      render json: {
        error: "Account Not Found"
      }
    end

  end

  def destroy
    account = Account.find_by(id: params[:id])
    if account
      account.destroy
      render json: "Account has been deleted"
    end
  end


  def find_by_vat
    account = Account.find_by(vat: params[:vat])
    if account
      render json: account.attributes.except('id'), status: 2
    end
  end




  private
  def arti_params
    params.require(:account).permit(:fullName, :vat, :city, :zipcode, :address)
  end
  end

