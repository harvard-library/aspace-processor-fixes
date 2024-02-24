fix_for 'unittitle-2', depends_on: %w|noempty-1 noempty-2| do
  unittitles_by_id = {}
  @xml.xpath("//unittitle[@id and @id != '']").each do |utitle|
    if unittitles_by_id[utitle['id']]
      raise Fixes::Failure.new("Duplicate @id value in unittitless: #{utitle['id']}")
    end
    unittitles_by_id[utitle['id']] = utitle
  end
  @xml.xpath("//ref[@target]").each do |ref|
    if ut = unittitles_by_id[ref['target']]
      # rewrite ref to target enclosing 'c' instead
      ancestor_cs = ut.xpath("./ancestor::*[contains('c c01 c02 c03 c04 c05 c06 c06 c08 c09 c10 c11 c12', local-name()) and @id]")
      if ancestor_cs.count > 0
        ref['target'] = ancestor_cs.last['id']
      else
        raise Fixes::Failure.new("No c with id to target")
      end
    end
  end
end
