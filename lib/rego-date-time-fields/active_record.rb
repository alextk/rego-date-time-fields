module DateTimeFields
  module ActiveRecord
    module ClassMethods
      def date_attr_writer(*attributes)
        raise ArgumentError.new("At least one attribute must be passed") if attributes.empty?
        options = attributes.last.is_a?(Hash) ? attributes.pop : {}
        options = {:date_format => I18n.t('date.formats.default')}.update(options)
        attributes.each do |attr|
          self.class_eval %{
            def #{attr}
              read_attribute(:#{attr})
            end

            def #{attr}=(new_value)
              @raw_#{attr} = new_value
              self[:#{attr}] = DateTimeFields::TypeCaster.string_to_date(new_value, '#{options[:date_format]}')
            end

            def #{attr}_before_type_cast
              result = @raw_#{attr} || self[:#{attr}]
              result.is_a?(Date) ? I18n.l(result, :format => '#{options[:date_format]}') : result
            end
          }
        end
      end

      def timestamp_attr_writer(*attributes)
        raise ArgumentError.new("At least one attribute must be passed") if attributes.empty?
        options = attributes.last.is_a?(Hash) ? attributes.pop : {}
        options = {:date_format => I18n.t('date.formats.default'), :time_format => '%H:%M'}.update(options)
        attributes.each do |attr|
          attr_date = "#{attr}_date"
          attr_time = "#{attr}_time"
          attr_js_timestamp = "#{attr}_js_timestamp"
          self.class_eval %{
            def #{attr_date}
              if self.#{attr}.nil?
                @#{attr_date}
              else
                self.#{attr}.to_date
              end
            end

            def #{attr_time}
              if self.#{attr}.nil?
                @#{attr_time}
              else
                self.#{attr}.strftime('#{options[:time_format]}')
              end
            end

            def #{attr_js_timestamp}
              (self.#{attr}.to_f*1000).to_i if !self.#{attr}.nil?
            end

            def #{attr_date}=(new_value)
              @raw_#{attr_date} = new_value
              @#{attr_date} = DateTimeFields::TypeCaster.string_to_date(new_value, '#{options[:date_format]}')

              casted_time = DateTimeFields::TypeCaster.string_to_time(#{attr_time}_before_type_cast, '#{options[:time_format]}')
              self.#{attr} = DateTimeFields::TypeCaster.date_and_time_to_timestamp(@#{attr_date}, casted_time, '#{options[:time_format]}')
            end

            def #{attr_time}=(new_value)
              @raw_#{attr_time} = new_value
              @#{attr_time} = DateTimeFields::TypeCaster.string_to_time(new_value, '#{options[:time_format]}')

              casted_date = DateTimeFields::TypeCaster.string_to_date(#{attr_date}_before_type_cast, '#{options[:date_format]}')
              self.#{attr} = DateTimeFields::TypeCaster.date_and_time_to_timestamp(casted_date, @#{attr_time}, '#{options[:time_format]}')
            end

            def #{attr_js_timestamp}=(new_value)
              @raw_#{attr_js_timestamp} = new_value
              if new_value.present?
                @#{attr_js_timestamp} = new_value.to_i/1000
                self.#{attr} = Time.at(@#{attr_js_timestamp})
              end
            end

            def #{attr_date}_before_type_cast
              result = @raw_#{attr_date} || #{attr_date}
              result.is_a?(Date) ? I18n.l(result, :format => '#{options[:date_format]}') : result
            end

            def #{attr_time}_before_type_cast
              @raw_#{attr_time} || #{attr_time}
            end

            def #{attr_js_timestamp}_before_type_cast
              @raw_#{attr_js_timestamp} || #{attr_js_timestamp}
            end

          }
        end
      end
    end
  end
end

