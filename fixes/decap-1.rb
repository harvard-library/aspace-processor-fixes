# Remove all heads
fix_for 'decap-1', depends_on: ['da-1'] do
  @xml.xpath('//head').each do |head|
    head.remove
  end
end
