class GildedRose
  def initialize(items)
      @items = items
  end

  def increase_quality(item, value)
      if item.quality + value <= 50
          item.quality += value
      else
          item.quality = 50
      end
  end
    
  def decrease_quality(item, value)
      if item.quality - value >= 0
          item.quality -= value
      else
          item.quality = 0
      end
  end
  
  def update_quality
      @items.each do |item|
          case item.name
          when 'Sulfuras, Hand of Ragnaros'
          
          when 'Aged Brie'
              if item.quality < 50
                  item.quality += 1
              end
              item.sell_in -= 1
          when 'Backstage passes to a TAFKAL80ETC concert'
              if item.sell_in <= 0
                  item.quality = 0
              elsif item.sell_in <= 5
                  increase_quality(item, 3)
              elsif item.sell_in <= 10
                  increase_quality(item, 2)
              else
                  increase_quality(item, 1)
              end
              item.sell_in -= 1
          when 'Conjured'
              if item.quality > 0
                  if item.sell_in < 0
                      decrease_quality(item, 4)
                  else
                      decrease_quality(item, 2)
                  end
              end
              item.sell_in -= 1
          else
              if item.quality > 0
                  if item.sell_in < 0
                      decrease_quality(item, 2)
                  else
                      decrease_quality(item, 1)
                  end
              end
              item.sell_in -= 1
          end
      end
  end
end