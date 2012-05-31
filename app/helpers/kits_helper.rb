module KitsHelper
  def nested_kits(kits)
    kits.map do |kit, sub_kits|
        content_tag(:li, link_to(kit.title, kit) ) + content_tag(:div, nested_kits(sub_kits), :class => "nested_kit")
    end
  end
end
