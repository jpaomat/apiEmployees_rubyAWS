class EmployeesController < ApplicationController
    before_action :set_employee, only: [:update, :delete]
    before_action :set_employee_idEmployee, only: [:show]
  
    # GET /employees
    def index
        employees = Employee.all
        render json: response_json("Employees loaded correctly", employees), status: :ok
    end
  
    # GET /employees/1
    def show
        puts "ESTE ES EL EMPLEADO #{@employee_id}"
        render json: response_json("Employee loaded correctly", @employee_id), status: :ok
    end
  
    # POST /employees
    def create
      employee = Employee.new(employee_params)
  
      if employee.save
        render json: response_json("Employee created correctly", employee), status: :ok
      else
        render json: response_json("Internal server error", employee), status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /employees/1
    def update
      if @employee.update(employee_params)
        render json: response_json("Employee updated correctly", @employee), status: :ok
      else
        render json: response_json("Internal server error", @employee), status: :unprocessable_entity
      end
    end
  
    # DELETE /employees/1
    def delete
        if @employee.destroy
            render json: response_json("Employee deleted correctly", @employee), status: :ok
        else
            render json: response_json("Internal server error", @employee), status: :unprocessable_entity
        end
    end
  
    private
      def set_employee
        @employee = Employee.find(params[:id])
      end

      def set_employee_idEmployee
        @employee_id = Employee.where({idEmployee: params[:id]})
      end

      def employee_params
        # params.require(:employee).permit(:idEmployee, :fullname, :occupation, :idBoss)
        params.permit(:idEmployee, :fullname, :occupation, :idBoss)
      end
      
      def response_json(message, data, error=false)
        {
            status: (!error) ? "Successfully" : "Error",
            message: message,
            data: (!error) ? data : data.errors
        }
      end
  end
  