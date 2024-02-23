fix_for '"kheel-titleproper-date-1"', depends_on: ['noempty-1', 'noempty-2'] do
  @xml.xpath('//titleproper[.//date]').each do |tp|
    # remove date entirely and then strip trailing punct
    tp.xpath('.//date').each do |d|
      d.remove
      tp.content = tp.content.sub(/\s*[.,]*\s*$/, '')
    end
  end
end
