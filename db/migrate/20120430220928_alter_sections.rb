class AlterSections < ActiveRecord::Migration
  def up
  	rename_column("sections", "visilbe", "visible")
  end

  def down
  	rename_column("sections", "visible", "visilbe")
  end
end
