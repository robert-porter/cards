class Admin::ShippingController < Admin::AdminController

  def purchase_shipping

  end

  def get_rates

    order = Order.find(params[:order_id])
    weight = params[:package_weight].to_i
    package_type = params[:package_type]
    package = ActiveShipping::Package.new(weight, [0, 0, 0], {value: 30.0, units: :imperial})

    @rate_response = Shipping.get_rates package, order.address, package_type

    @rates = @rate_response.rates.each do |rate|
      rate.add_ons.keep_if do |key, value|
        Shipping::ADD_ONS.has_key?(key)
      end
    end

    respond_to do |format|
      format.js   { render 'admin/shipping/get_rates' }
      return
    end
  end

  def create_shipment
    order = Order.find(params[:order_id])
    service = params[:service_name]
    weight = params[:package_weight].to_i
    package_type = params[:package_type]
    package = ActiveShipping::Package.new(1, [0,0,0], {value: 30.0})

    pp 'BUYING POSTAGE'
  end

  private


end
=begin

  @available_postage="94.9400",
      @control_total="100.00",
      @image_data=nil,
      @label_url=
          "https://swsim.testing.stamps.com/Label/label.ashx/label-200.png?AQAAAMC9xwhDmNIIIjh-BDBO-Tga1W8MT1NUK6mch154nDNItWIQ4D8ok2edaufS4870LG3V_8UCd-sTzge1_3LYd3JTda3l6Xt8BmZGwQYGxgZGlhYmxubcoXklRYnJ2YlJOanKQAN4g_KTUotKFALyi0pSi_7__y9iYmhgquBelFpZXJKfl6rgUpRZlgoUZ3MsLS7JzGMKiWA1tzA3Nvz_nxmonasktbhEIam0EqyX01DBNzEzTyG4BMjhCE7MU_DKL05lcnZktTQ1BGn5zxual1mSmgJUkQjU-f8_IwMjA8Q8hiQGZMDEwBDPyvj_PwMDyP2ugecYjwgDha8wM5yoNGbsNmaEqmMBEXeKGBkMDQ2MOOsOFW35kpL8zELwYx_LxAkpxier7N9IC_OyKYixTjKvkj67YGuy6xpDRgawAazF5cWZuQwMDTLV96dd4oDSHQyEADPQVYwMNAHsQH9DzcYID5xAEaQHrAlEgqLlPwbgZGA0Bitm_M8AAAy6igo=",
      @message="",
      @params={},
      @rate=
          #<ActiveShipping::StampsRateEstimate:0x007f254a2e9c78
          @add_ons={},
      @carrier="Stamps",
      @currency="USD",
      @delivery_date=Fri, 31 Jul 2015 00:00:00 +0000,
      @delivery_range=[Fri, 31 Jul 2015 00:00:00 +0000],
      @destination=95131
  United States,
         @estimate_reference=nil,
         @expires_at=nil,
         @insurance_price=nil,
         @negotiated_rate=nil,
         @origin=78731,
         @package_rates=
             [{:package=>
                   #<ActiveShipping::Package:0x007f254a2e9e80
                   @currency="USD",
               @cylinder=false,
               @dimensions=
                   [#<Quantified::Length: 0 inches>,
                       #<Quantified::Length: 0 inches>,
                       #<Quantified::Length: 0 inches>],
                       @dimensions_unit_system=:imperial,
                       @gift=false,
                       @options={:units=>:imperial, :value=>30.0, :currency=>"USD"},
                       @oversized=false,
                       @unpackaged=false,
                       @value=3000,
                       @weight=#<Quantified::Mass: 1.0 ounces>,
                           @weight_unit_system=:imperial>}],
         @pickup_time=nil,
         @service_code="US-FC",
         @service_name="USPS First-Class Mail",
         @shipping_date=Tue, 28 Jul 2015 00:00:00 +0000,
      @total_price=98>,
          @request=
              "<?xml version=\"1.0\"?>\n<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://stamps.com/xml/namespace/2014/01/swsim/swsimv34\">\n  <soap:Body>\n    <tns:CreateIndicium>\n      <tns:Authenticator>exp=1438194308&amp;uid=2941292&amp;cty=swsim&amp;ctk=nZDVvvjWA41rpNzX5uOdRiwyehs=&amp;iid=3X9gz1KH+kC+ybJ7fTnL3g==&amp;rsid=0&amp;irsid=0&amp;eac=2088717755&amp;eacx=29554687&amp;eac3=0&amp;rrsid=0&amp;raid=0&amp;resellerid=0&amp;pexp=0&amp;pl=&amp;ast=1&amp;ipaddr=72.177.22.106&amp;ace=1438111507&amp;mac=lB3dS6yxY4LNM8LhAaAwCR7hi7o=</tns:Authenticator>\n      <tns:IntegratorTxID>013c8982-3a2d-425d-b969-815a77e2712b</tns:IntegratorTxID>\n      <tns:Rate>\n        <tns:FromZIPCode>78731</tns:FromZIPCode>\n        <tns:ToZIPCode>95131</tns:ToZIPCode>\n        <tns:ToCountry>US</tns:ToCountry>\n        <tns:ServiceType>US-FC</tns:ServiceType>\n        <tns:WeightOz>1</tns:WeightOz>\n        <tns:PackageType>Large Envelope or Flat</tns:PackageType>\n        <tns:Length>0.0</tns:Length>\n        <tns:Width>0.0</tns:Width>\n        <tns:Height>0.0</tns:Height>\n        <tns:ShipDate>2015-07-28</tns:ShipDate>\n        <tns:InsuredValue>30.00</tns:InsuredValue>\n        <tns:NonMachinable>true</tns:NonMachinable>\n        <tns:RectangularShaped>true</tns:RectangularShaped>\n        <tns:ToState>CA</tns:ToState>\n      </tns:Rate>\n      <tns:From>\n        <tns:FullName>Robert Porter</tns:FullName>\n        <tns:Address1>4105 Greystone Drive</tns:Address1>\n        <tns:City>Austin</tns:City>\n        <tns:State>TX</tns:State>\n        <tns:ZIPCode>78731</tns:ZIPCode>\n        <tns:Country>US</tns:Country>\n      </tns:From>\n      <tns:To>\n        <tns:FullName>test buyer</tns:FullName>\n        <tns:Address1>1 Main St</tns:Address1>\n        <tns:City>San Jose</tns:City>\n        <tns:State>CA</tns:State>\n        <tns:ZIPCode>95131</tns:ZIPCode>\n        <tns:Country>US</tns:Country>\n      </tns:To>\n    </tns:CreateIndicium>\n  </soap:Body>\n</soap:Envelope>\n",
          @shipping_id="013c8982-3a2d-425d-b969-815a77e2712b",
          @stamps_tx_id="6e1cc10f-653b-443e-8c47-02e666aaffa3",
          @success=true,
          @test=true,
          @tracking_number="00040899562536920487",
          @xml=
=end