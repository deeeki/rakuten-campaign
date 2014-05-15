module ApplicationHelper
  def emphasize_point_rates str
    rates = str.to_s.scan(/ポイント[^(ポイント)]*?\d+倍/).uniq
    return str if rates.empty?
    raw(rates.inject(str){|str, rate| str.gsub(rate, content_tag(:strong, rate)) })
  end
end
