xml.instruct!
xml.kml xmlns: 'http://www.opengis.net/kml/2.2' do
  xml.Document do

    xml.Style id: 'fefara' do
      xml.IconStyle do
        xml.Icon do
          xml.href "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-f34648/shapecolor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshadowstyle-dark/gradient-iphone/firstaid.png"
        end
      end
    end

    xml.Style id: 'compania' do
      xml.IconStyle do
        xml.Icon do
          xml.href "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-3875d7/shapecolor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshadowstyle-dark/gradient-iphone/firstaid.png"
        end
      end
    end

    @networks.each do |network|
      xml.Folder do
        xml.name network.name
        network.places.each do |place|
          xml.Placemark do
            xml.name place.name
            xml.styleUrl "##{ network.name }"
            xml.description place.address
            xml.Point do
              xml.coordinates "#{ place.lat },#{ place.lng}"
            end
          end
        end
      end
    end

  end
end
