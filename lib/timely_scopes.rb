require "timely_scopes/railtie"

module TimelyScopes
  extend ActiveSupport::Concern

  class Error < StandardError; end
  class AmbiguousColumnError < Error; end
  class ArgumentFormatError < Error; end
  class NoColumnError < Error; end
  class UnsupportedColumnError < Error; end

  class_methods do
    def add_timely_scopes(*names)
      names.each do |name|
        match_data = name.match(/\A(\w+)(_after|_before|_from|_until)\z/)
        raise ArgumentFormatError, "#{name.inspect} does not match expected format" if match_data.nil?

        prefix, suffix = match_data.captures
        matching_columns = columns.select { |c| c.name.start_with?(prefix) }

        case matching_columns.length
        when 0
          raise NoColumnError, "#{prefix.inspect} does not match the start of any column names"
        when 1
          column = matching_columns.first

          unless [:date, :datetime].include?(column.type)
            raise UnsupportedColumnError, "column type #{column.type.inspect} not supported"
          end
        else
          raise AmbiguousColumnError, "#{name.inspect} matched multiple columns: #{matching_columns.map(&:name).to_sentence}"
        end

        comparison =
          case suffix
          when "_after" then :gt
          when "_before" then :lt
          when "_from" then :gteq
          when "_until" then :lteq
          end

        scope name, lambda { |arg| where(arel_table[column.name].public_send(comparison, arg)) }
      end
    end
  end
end
