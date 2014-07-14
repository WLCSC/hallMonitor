class Student < ActiveRecord::Base
    has_many :activities

    def status
        activities.last ? activities.last.status : "UNK"
    end

    def destination
        activities.last && activities.last.destination ? activities.last.destination : "Unknown"
    end

    def nice_status
        case status
        when 'OUT'
            'Out of Class'
        when 'CLS'
            'In Class'
        when 'HAL'
            'Hallway'
        when 'WRK'
            'Working Somewhere'
        when 'OFC'
            'Office'
        when 'ITO'
            'IT Office'
        when 'LAT'
            'Late'
        when 'ABS'
            'Absent'
        when "UNK"
            'Not Sure'
        else
            'UNKNOWN STATUS'
        end
    end
end
