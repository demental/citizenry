class SearchEngine::Sql < SearchEngine::Base
  score false

  def self.add_sql_search_to(model, *fields)
    (class << model; self; end).instance_eval do
      # Return an Array of non-duplicate Event instances matching the search +query+..
      #
      # Options:
      # * :order => How to order the entries? Defaults to :date. Permitted values:
      #   * :date => Sort by date
      #   * :name => Sort by event title
      #   * :title => same as :name
      #   * :venue => Sort by venue title
      # * :limit => Maximum number of entries to return. Defaults to 50.
      define_method(:search) do |query, *opts|

        opts = opts.first
        opts ||= {}
        limit = opts[:limit]
        order = opts[:order] || "LOWER(#{self.table_name}.name) ASC"
        
        conditions_text = fields.map{|field| "LOWER(#{self.table_name}.#{field}) LIKE :like_query"}.join(" OR ")
        conditions = [conditions_text, {:like_query => "%#{query.downcase}%"}]

        if( !limit )
          self.where(conditions).order(order)
        else
          self.where(conditions).order(order).limit(limit)
        end
        
      end
    end
  end

  def self.add_searching_to(model)
    case model.new
    when Person
      add_sql_search_to(model, :name, :url, :bio, :location)
    when Company, Group, Project, ResourceLink
      add_sql_search_to(model, :name, :description, :url)
    else
      raise TypeError, "Unknown model class: #{model.name}"
    end
  end

  def self.search(query, options = {})
    results = SearchEngine.searchable_models.map {|model|
      model.to_s.constantize.search(query, options)
    }.flatten
    if(!options[:limit])
      page = (options.delete(:page) if options[:page].present?) || 1
      per_page = (options.delete(:per_page) if options[:per_page].present?) || 30
      Kaminari.paginate_array(results).page(page).per(per_page)
    else
      results
    end
  end
end
