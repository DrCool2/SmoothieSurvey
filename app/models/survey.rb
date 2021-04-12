class Survey < ApplicationRecord
  belongs_to :smoothiechoice

  validates :user_id, uniqueness: true, message: "You may only submit ONE survey!"

def self.survey_results

  total_survey_results = Hash.new()
  
  

  Smoothiechoice.ids.each do |smoothieid|
  #  total_survey_results.store(Smoothiechoice.find_by_id(smoothieid).name, Survey.find_by_smoothiechoice_id(smoothieid).count(:id)
     smoothie_name = Smoothiechoice.find(smoothieid).name
     smoothie_count = Survey.where("smoothiechoice_id like ?", smoothieid).count
     # total_survey_count = smoothie_count + total_survey_count

     total_survey_results[smoothie_name] =  smoothie_count
         
  end

  total_survey_results = total_survey_results.sort_by.to_a
  return total_survey_results
end

end
