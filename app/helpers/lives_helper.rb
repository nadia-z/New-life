module LivesHelper
  def feature_icon(feature)
    icons = {
      "Homemade meals" => "fas fa-utensils",
      "Bedtime storytelling" => "fas fa-book",
      "Laundry tutorials" => "fas fa-jug-detergent",
      "School drop-offs" => "fas fa-car",
      "Grocery runs" => "fas fa-cart-shopping",
      # Add more features here...
    }

    icons[feature] || "fas fa-check"
  end
end
