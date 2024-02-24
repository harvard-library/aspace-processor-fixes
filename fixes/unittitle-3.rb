fix_for 'unittitle-3', depends_on: ['noempty-1', 'noempty-2'] do
  @xml.xpath('//unittitle[.//unitdate]').each do |ut|
    # Because we're moving uds into following-sibling position of ut,
    #   process unitdates in reverse
    # NOTE: Altered for Kheel to remove entirely and then strip trailing punct
    ut.xpath('.//unitdate').reverse.each do |ud|
      ut.add_next_sibling(ud.dup)
      ud.content = ''
      ud.remove
      ut.content = ut.content.sub(/\s*[.,]*\s*$/, '')
    end
  end
end
