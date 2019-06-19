class EmployeesController < ApplicationController

def new
    @employee = Employee.new(employee_params)
end

def area_find
    @area_find = Area.find(employee.area_id)
end

def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
        if @employee.save
        format.html { redirect_to @employee.company, notice: 'Empleado creado' }
        format.json { render :show, status: :created, location: @employee }
        else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
    end
end

def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
        format.html { redirect_to @employee.company, notice: 'Empleado eliminado' }
        format.json { head :no_content }
    end
end

private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :company_id, :area_id)
    end

end
