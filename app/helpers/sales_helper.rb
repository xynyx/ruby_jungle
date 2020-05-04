# Helpers help render our views

module SalesHelper

  def active_sale?
    Sale.active.any?
  end

end
