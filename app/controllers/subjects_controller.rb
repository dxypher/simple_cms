class SubjectsController < ApplicationController
	layout 'admin'
	def index
    list
    render('list')
  	end

	def list
		@subjects =	Subject.order("subjects.position ASC")
	end

	def show
		@subject = Subject.find_by_id(params[:id])
	end

	def new
		@subject = Subject.new
	end

	def create
		@subject = Subject.new(params[:subject])
		@subject.save
		if @subject.save
			flash[:notice]  = "Subject created"
			redirect_to(:action =>'list')
		else
			render('new')
		end
	end

	def edit
		@subject = Subject.find_by_id(params[:id])
	end

	def update
		@subject = Subject.find_by_id(params[:id])
		
		if @subject.update_attributes(params[:subject])
			flash[:notice]  = "Subject updated"
			redirect_to(:action =>'show', :id => @subject.id)
		else
			render('edit')
		end
	end

	def delete
		@subject = Subject.find_by_id(params[:id])
	end

	def destroy
		Subject.find_by_id(params[:id]).destroy
		flash[:notice]  = "Subject deleted"
		redirect_to(:action => 'list')
	end
end
