# The methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def date_field(obj_name, met_name, suffix=nil)
    obj = self.instance_variable_get "@#{obj_name}"
    val = (obj.nil? || obj.send(met_name).nil?) ? 'Clique' : obj.send(met_name).strftime('%d/%m/%Y')
		
		suffix = "_" + suffix.to_s if suffix

		iid = "#{obj_name}_#{met_name}#{suffix}"
		da = "disp_area#{suffix}"

    html = <<-HTML
      <input type='hidden' name='#{obj_name}[#{met_name}]' id='#{iid}' />
      <span id='#{da}'>#{val}</span>
      <script type='text/javascript'>
          Calendar.setup({
              inputField     :    '#{iid}',
              ifFormat       :    '%m/%d/%Y',
              displayArea    :    '#{da}',
              daFormat       :    '%d/%m/%Y',
              align          :    'Tl',
              singleClick    :    true
          });
      </script>
    HTML

  end

end
