module Granite::Converters
  # Converts a `Date` to/from a database column of type `T`.
  #
  # Valid types for `T` include: `String`.
  module Date(T)
    extend self

    def to_db(value : ::Date?) : Granite::Columns::Type
      return nil if value.nil?
      {% if T == String %}
        value.to_s
      {% else %}
        {% raise "#{@type.name}#to_db does not support #{T} yet." %}
      {% end %}
    end

    def from_rs(result : ::DB::ResultSet) : ::Date?
      value = result.read(T?)
      return nil if value.nil?
      {% if T == String %}
        ::Date.parse value
      {% else %}
        {% raise "#{@type.name}#from_rs does not support #{T} yet." %}
      {% end %}
    end
  end
end
