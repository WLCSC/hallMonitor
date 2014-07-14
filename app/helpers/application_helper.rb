module ApplicationHelper
    def i(icon)
        fa_icon(icon + " fa-fw").html_safe
    end

    def i_submit_button(value, c)
        ('<button class="btn-goto ' + c + '" value="' + value + '">' + status_icon(value) + "<br/>" + nice_status(value)  + '</button>').html_safe
    end

    def status_icon(status) 
        case status
        when 'OUT'
            i 'sign-out'
        when 'CLS'
            i 'graduation-cap'
        when 'HAL'
            i 'paper-plane'
        when 'WRK'
            i 'briefcase'
        when 'OFC'
            i 'institution'
        when 'ITO'
            i 'level-down'
        when 'LAT'
            i 'clock-o'
        when 'ABS'
            i 'times-circle'
        when "UNK"
            i 'question-circle'
        else
            i 'question'
        end.html_safe
    end

    def nice_status status
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
