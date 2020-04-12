class StateController < ApplicationController
  skip_before_filter :verify_authenticity_token 
  
  def info
    
  end
  
  def downloadCSV
    require 'open-uri'
  
    File.open('#{Rails.root.to_s}/db/csv_for_import/info.csv', "wb") do |file|
      file.write open('https://data.cdc.gov/api/views/hc4f-j6nb/rows.csv?accessType=DOWNLOAD&bom=true&format=true').read
    end
  end
  
  def import_from_excel
     file = params[:file]
          begin
            file_ext = File.extname(file.original_filename)
            raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
            spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
            header = spreadsheet.row(1)
            ## We are iterating from row 2 because we have left row one for header
            (26..78).each do |i|
              State.create(name: spreadsheet.row(i)[1], deaths: spreadsheet.row(i)[2])
            end
            flash[:success] = "Records Imported"
            redirect_to root_path
          rescue Exception => e
            flash[:error] = "Issues with file"
            redirect_to root_path 
          end
  end
  
  def clear
    State.all.each do |i|
      i.destroy
    end
    redirect_back(fallback_location: import_from_excel_path)
  end
  
  def destroy
    State.find(params[:id]).destroy
  end
end
