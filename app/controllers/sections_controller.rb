class SectionsController < ApplicationController
	def list
		@sections = Section.order("sections.position ASC")
	end

	def show
		@section = Section.find_by_id(params[:id])
	end

	def new
		@section = Section.new
	end

	def create
		@section = Section.new(params[:section])
		@section.save
		if @section.save
			redirect_to(:action => 'list')
		else
			render('new')
		end
	end

	def edit
		@section = Section.find_by_id(params[:id])
	end

	def update
		@section = Section.find_by_id(params[:id])
		if @section.update_attributes(params[:section])
			redirect_to(:action => 'show', :id => @section.id)
		else
			render('edit')
		end
		
	end

	def delete
		@section = Section.find_by_id(params[:id])
	end

	def destroy
		Section.find_by_id(params[:id]).destroy
		redirect_to(:action => 'list')
		
	end
end
