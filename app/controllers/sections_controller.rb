class SectionsController < ApplicationController
	layout 'admin'
	def list
		@sections = Section.order("sections.position ASC")
	end

	def show
		@section = Section.find_by_id(params[:id])
	end

	def new
		@section = Section.new
		@section_count = Section.count + 1
		
	end

	def create
		@section = Section.new(params[:section])
		@section.save
		if @section.save
			redirect_to(:action => 'list')
		else
			@section_count = Section.count + 1
			render('new')
			
			

		end
	end

	def edit
		@section = Section.find_by_id(params[:id])
		@section_count = Section.count
		@page_count = Page.count
	end

	def update
		@section = Section.find_by_id(params[:id])
		if @section.update_attributes(params[:section])
			redirect_to(:action => 'show', :id => @section.id)
		else
			@section_count = Section.count
			@page_count = Page.count
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
