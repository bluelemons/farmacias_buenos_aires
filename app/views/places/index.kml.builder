xml.instruct!
xml.kml xmlns: 'http://www.opengis.net/kml/2.2' do
  xml.Document do

    xml.name "Red de farmacias"
    xml.description "Red de farmacias"

    @networks.each do |network|
      xml.Style id: network.name do
        xml.IconStyle do
          xml.Icon do
            xml.href "http://farmacias-buenos-aires.herokuapp.com/icon_#{ network.name }.png"
          end
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
              xml.coordinates "#{ place.lng },#{ place.lat }"
            end
          end
        end
      end
    end

  end
end
