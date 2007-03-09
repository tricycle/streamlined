module Streamlined::Views::EditViews
  def self.create_relationship(sym, options = nil)
    Class.class_eval(Inflector.camelize(sym.to_s)).new options
  end  

  # Factory method for creating a relationship View given the name of a view.
  # Renders an Ajax-enabled table, with add/edit/delete capabilities.
  class InsetTable < Streamlined::Column::View
    
  end
  
  # Renders an Ajax-enabled checkbox list for managing which items belong to the collection.
  class Membership < Streamlined::Column::View
    
  end
  
  # Like Membership, but lists all possibles from multiple polymorphic associables
  class PolymorphicMembership < Streamlined::Column::View
    
  end
  
  # Renders an Ajax-enabled table in a JavaScript window.
  class Window < Streamlined::Column::View
    def partial
      "/streamlined/relationships/views/inset_table"
    end
  end
  
  # Renders a select box with all possible values plus "unassigned". Used for n-to-one relationships.
  class Select < Streamlined::Column::View
    
  end
  
  # Like Select, but lists all possibles from multiple polymorphic associables
  class PolymorphicSelect < Streamlined::Column::View
    
  end
  
  # Like Membership, but with two distinct groups of checkboxes and an autofilter field
  class FilterSelect < Streamlined::Column::View
  
    def render_on_update(page, rel_name, id)
      page.replace_html "rel_#{rel_name}_#{id}_unselected", :partial => '/streamlined/relationships/views/filter_select/unselected_items'
      page.replace_html "rel_#{rel_name}_#{id}_selected", :partial => '/streamlined/relationships/views/filter_select/selected_items'
    end
  end
  
  # Suppresses rendering of the expanded relationship view.
  class None < Streamlined::Column::View
    def partial
      nil
    end
  end
end
