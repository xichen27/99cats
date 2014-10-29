# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string(255)      default("PENDING")
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  STATUS = [
    "PENDING",
    "APPROVED",
    "DENIED"
  ]
  validates :cat_id, :start_date, :status, :presence => true
  validates :status, :inclusion => STATUS
  
  belongs_to :cat, dependent: :destroy
  
  def overlapping_requests
    CatRentalRequest
      .where("
        cat_id = ?
        AND
        (start_date >= ? AND start_date <= ?)
        OR
        (end_date >= ? AND end_date <= ?)", cat_id, start_date, end_date, start_date, end_date)
      .where(
        "(id != ?)", id
      )
  end
  
  def overlapping_approved_requests
    approved_requests = []
    overlapping_requests.each do |request|
      if request.status == "APPROVED"
        approved_requests << request
      end
    end
    approved_requests
  end
  
  def approve 
    if overlapping_approved_requests.empty?
      self.status = "APPROVED"
      self.save
      ActiveRecord::Base.transaction do
        overlapping_requests.each do |request|
          request.update(status: "DENIED")
        end
      end
    end
  end
  
  
end
