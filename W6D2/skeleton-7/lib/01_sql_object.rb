require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.instance.execute2(<<-SQL)
    select *
    from #{self}s
    limit 0
    SQL

    cols.first.map! {|el| el = el.to_sym}

    @columns = cols.first
  end

  def self.finalize!
    self.columns.each do |col|
      define_method("#{col}") do
        self.attributes[col]
      end

      define_method("#{col}=") do |val|
        self.attributes[col] = val
      end
    end


    
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || "#{self}".downcase + "s"
  end

  def self.all
    rows = DBConnection.execute(<<-SQL)
    select *
    from #{self}s

    SQL

    self.parse_all(rows)
  end

  def self.parse_all(results)
    results.map {|result| self.new(result)}
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
    select *
    from #{self}s
    where id = ?
    SQL

   self.parse_all(results).first
  end

  def initialize(params = {})
    params.each do |key, value|
      key = key.to_sym
      if self.class.columns.include?(key)
        self.send("#{key}=", value)
      else
        raise "unknown attribute '#{key}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
