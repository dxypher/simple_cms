class SubjectsController < ApplicationController

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
		redirect_to(:action => 'list')
	end
end
