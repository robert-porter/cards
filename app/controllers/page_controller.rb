=begin
{:condition=>
      [{:id=>"1000", :display_name=>"Brand New"},
       {:id=>"2750", :display_name=>"Like New"},
       {:id=>"4000", :display_name=>"Very Good"},
       {:id=>"5000", :display_name=>"Good"},
       {:id=>"6000", :display_name=>"Acceptable"}],


=end

=begin
      [{:duration_set_id=>"1",
        :duration=>["Days_3", "Days_5", "Days_7", "Days_10"]},
       {:duration_set_id=>"2", :duration=>["Days_30", "Days_90"]},
       {:duration_set_id=>"7", :duration=>["Days_30", "GTC"]},
       {:duration_set_id=>"14", :duration=>["Days_30", "Days_60", "Days_90"]},
       {:duration_set_id=>"31",
        :duration=>
         ["Days_3", "Days_5", "Days_7", "Days_10", "Days_30", "GTC"]}]},
=end

=begin
:name_recommendation=>
    [{:name=>"Professional Grader",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"1",
        :selection_mode=>"FreeText",
        :variation_specifics=>"Disabled"},
      :value_recommendation=>
       [{:value=>"Not Professionally Graded", :validation_rules=>nil},
        {:value=>"Beckett (BGS)", :validation_rules=>nil},
        {:value=>"Beckett (BVG)", :validation_rules=>nil},
        {:value=>"Beckett (BCCG)", :validation_rules=>nil},
        {:value=>"Global Authentics (GAI)", :validation_rules=>nil},
        {:value=>"Professional Sports (PSA)", :validation_rules=>nil},
        {:value=>"Sportscard (SGC)", :validation_rules=>nil}]},
     {:name=>"Certification Number",
      :validation_rules=>
       {:value_type=>"Text", :max_values=>"1", :selection_mode=>"FreeText"}},
     {:name=>"Grade",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"1",
        :selection_mode=>"FreeText",
        :variation_specifics=>"Disabled"},
      :value_recommendation=>
       [{:value=>"Ungraded", :validation_rules=>nil},
        {:value=>"10", :validation_rules=>nil},
        {:value=>"9.5", :validation_rules=>nil},
        {:value=>"9", :validation_rules=>nil},
        {:value=>"8.5", :validation_rules=>nil},
        {:value=>"8", :validation_rules=>nil},
        {:value=>"7.5", :validation_rules=>nil},
        {:value=>"7", :validation_rules=>nil},
        {:value=>"6.5", :validation_rules=>nil},
        {:value=>"6", :validation_rules=>nil},
        {:value=>"5.5", :validation_rules=>nil},
        {:value=>"5", :validation_rules=>nil},
        {:value=>"4.5", :validation_rules=>nil},
        {:value=>"4", :validation_rules=>nil},
        {:value=>"3.5", :validation_rules=>nil},
        {:value=>"3", :validation_rules=>nil},
        {:value=>"2.5", :validation_rules=>nil},
        {:value=>"2", :validation_rules=>nil},
        {:value=>"1.5", :validation_rules=>nil},
        {:value=>"1", :validation_rules=>nil},
        {:value=>"0.5", :validation_rules=>nil}]},
     {:name=>"Original/Reprint",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"1",
        :selection_mode=>"SelectionOnly",
        :variation_specifics=>"Disabled"},
      :value_recommendation=>
       [{:value=>"Original", :validation_rules=>nil},
        {:value=>"Reprint", :validation_rules=>nil},
        {:value=>"Unknown", :validation_rules=>nil}]},
     {:name=>"Era",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"1",
        :selection_mode=>"SelectionOnly"},
      :value_recommendation=>
       [{:value=>"Modern (1981-Now)", :validation_rules=>nil},
        {:value=>"Post-WWII (1942-1980)", :validation_rules=>nil},
        {:value=>"Pre-WWII (Pre-1942)", :validation_rules=>nil}]},
     {:name=>"Year",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"1",
        :selection_mode=>"FreeText",
        :variation_specifics=>"Disabled"},
      :value_recommendation=>
       [{:value=>"2015", :validation_rules=>nil},
        {:value=>"2014", :validation_rules=>nil},
        {:value=>"2013", :validation_rules=>nil},
        {:value=>"2012", :validation_rules=>nil},
        {:value=>"2011", :validation_rules=>nil},
        {:value=>"2010", :validation_rules=>nil},
        {:value=>"2009", :validation_rules=>nil},
        {:value=>"2008", :validation_rules=>nil},
        {:value=>"2007", :validation_rules=>nil},
        {:value=>"2006", :validation_rules=>nil},
        {:value=>"2005", :validation_rules=>nil},
        {:value=>"2004", :validation_rules=>nil},
        {:value=>"2003", :validation_rules=>nil},
        {:value=>"2002", :validation_rules=>nil},
        {:value=>"2001", :validation_rules=>nil},
        {:value=>"2000", :validation_rules=>nil},
        {:value=>"1999", :validation_rules=>nil},
        {:value=>"1998", :validation_rules=>nil},
        {:value=>"1997", :validation_rules=>nil},
        {:value=>"1996", :validation_rules=>nil},
        {:value=>"1995", :validation_rules=>nil},
        {:value=>"1994", :validation_rules=>nil},
        {:value=>"1993", :validation_rules=>nil},
        {:value=>"1992", :validation_rules=>nil},
        {:value=>"1991", :validation_rules=>nil}]},
     {:name=>"Product",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"1",
        :selection_mode=>"FreeText",
        :variation_specifics=>"Disabled"},
      :value_recommendation=>
       [{:value=>"Box", :validation_rules=>nil},
        {:value=>"Case", :validation_rules=>nil},
        {:value=>"etopps", :validation_rules=>nil},
        {:value=>"Pack", :validation_rules=>nil},
        {:value=>"Single", :validation_rules=>nil},
        {:value=>"Single-Insert", :validation_rules=>nil},
        {:value=>"Single-Parallel", :validation_rules=>nil},
        {:value=>"Set", :validation_rules=>nil},
        {:value=>"Team Set", :validation_rules=>nil},
        {:value=>"Uncut Sheet", :validation_rules=>nil},
        {:value=>"Lot", :validation_rules=>nil}]},
     {:name=>"Card Attributes",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"30",
        :selection_mode=>"FreeText",
        :variation_specifics=>"Disabled"},
      :value_recommendation=>
       [{:value=>"Autograph", :validation_rules=>nil},
        {:value=>"Rookie", :validation_rules=>nil},
        {:value=>"Piece of Authentic", :validation_rules=>nil},
        {:value=>"Serial Numbered", :validation_rules=>nil}]},
     {:name=>"League",
      :validation_rules=>
       {:value_type=>"Text", :max_values=>"1", :selection_mode=>"FreeText"},
      :value_recommendation=>
       [{:value=>"Major Leagues", :validation_rules=>nil},
        {:value=>"Minor Leagues", :validation_rules=>nil},
        {:value=>"Negro Leagues", :validation_rules=>nil}]},
     {:name=>"Team",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"1",
        :selection_mode=>"FreeText",
        :variation_specifics=>"Disabled"},
      :value_recommendation=>
       [{:value=>"Anaheim Angels", :validation_rules=>nil},
        {:value=>"Arizona Diamondbacks", :validation_rules=>nil},
        {:value=>"Atlanta Braves", :validation_rules=>nil},
        {:value=>"Baltimore Orioles", :validation_rules=>nil},
        {:value=>"Boston Red Sox", :validation_rules=>nil},
        {:value=>"Brooklyn Dodgers", :validation_rules=>nil},
        {:value=>"Chicago Cubs", :validation_rules=>nil},
        {:value=>"Chicago White Sox", :validation_rules=>nil},
        {:value=>"Cincinnati Reds", :validation_rules=>nil},
        {:value=>"Cleveland Indians", :validation_rules=>nil},
        {:value=>"Colorado Rockies", :validation_rules=>nil},
        {:value=>"Detroit Tigers", :validation_rules=>nil},
        {:value=>"Florida Marlins", :validation_rules=>nil},
        {:value=>"Houston Astros", :validation_rules=>nil},
        {:value=>"Kansas City Royals", :validation_rules=>nil},
        {:value=>"Lehigh Valley IronPigs", :validation_rules=>nil},
        {:value=>"Los Angeles Dodgers", :validation_rules=>nil},
        {:value=>"Milwaukee Brewers", :validation_rules=>nil},
        {:value=>"Minnesota Twins", :validation_rules=>nil},
        {:value=>"Montreal Expos", :validation_rules=>nil},
        {:value=>"Negro Leagues", :validation_rules=>nil},
        {:value=>"New Hampshire Fisher Cats", :validation_rules=>nil},
        {:value=>"New York Mets", :validation_rules=>nil},
        {:value=>"New York Yankees", :validation_rules=>nil},
        {:value=>"Norfolk Tides", :validation_rules=>nil}]},
     {:name=>"Player",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"1",
        :selection_mode=>"FreeText",
        :variation_specifics=>"Disabled"},
      :value_recommendation=>
       [{:value=>"Albert Pujols", :validation_rules=>nil},
        {:value=>"Alex Rodriguez", :validation_rules=>nil},
        {:value=>"Babe Ruth", :validation_rules=>nil},
        {:value=>"Barry Bonds", :validation_rules=>nil},
        {:value=>"Brett Lawrie", :validation_rules=>nil},
        {:value=>"Bryce Harper", :validation_rules=>nil},
        {:value=>"Cal Ripken, Jr.", :validation_rules=>nil},
        {:value=>"Chipper Jones", :validation_rules=>nil},
        {:value=>"Derek Jeter", :validation_rules=>nil},
        {:value=>"Frank Thomas", :validation_rules=>nil},
        {:value=>"Hank Aaron", :validation_rules=>nil},
        {:value=>"Ken Griffey Jr", :validation_rules=>nil},
        {:value=>"Mickey Mantle", :validation_rules=>nil},
        {:value=>"Mike Trout", :validation_rules=>nil},
        {:value=>"Nolan Ryan", :validation_rules=>nil},
        {:value=>"Pete Rose", :validation_rules=>nil},
        {:value=>"Roberto Clemente", :validation_rules=>nil},
        {:value=>"Robin Yount", :validation_rules=>nil},
        {:value=>"Sandy Koufax", :validation_rules=>nil},
        {:value=>"Stan Musial", :validation_rules=>nil},
        {:value=>"Steve Carlton", :validation_rules=>nil},
        {:value=>"Ted Williams", :validation_rules=>nil},
        {:value=>"Tony Gwynn", :validation_rules=>nil},
        {:value=>"Ty Cobb", :validation_rules=>nil},
        {:value=>"Willie Mays", :validation_rules=>nil}]},
     {:name=>"Card Manufacturer",
      :validation_rules=>
       {:value_type=>"Text",
        :max_values=>"1",
        :selection_mode=>"FreeText",
        :variation_specifics=>"Disabled"},
      :value_recommendation=>
       [{:value=>"Ace Authentic", :validation_rules=>nil},
        {:value=>"Be A Player", :validation_rules=>nil},
        {:value=>"Bowman", :validation_rules=>nil},
        {:value=>"Classic", :validation_rules=>nil},
        {:value=>"Collector's Edge", :validation_rules=>nil},
        {:value=>"Donruss", :validation_rules=>nil},
        {:value=>"Donruss/Playoff", :validation_rules=>nil},
        {:value=>"Fleer", :validation_rules=>nil},
        {:value=>"Goal Line", :validation_rules=>nil},
        {:value=>"Goudey", :validation_rules=>nil},
        {:value=>"In the Game", :validation_rules=>nil},
        {:value=>"Just Minors", :validation_rules=>nil},
        {:value=>"Leaf", :validation_rules=>nil},
        {:value=>"Onyx Authenticated", :validation_rules=>nil},
        {:value=>"O-PEE-CHEE", :validation_rules=>nil},
        {:value=>"Pacific", :validation_rules=>nil},
        {:value=>"Panini", :validation_rules=>nil},
        {:value=>"Parkhurst", :validation_rules=>nil},
        {:value=>"Philadelphia Gum", :validation_rules=>nil},
        {:value=>"Pinnacle", :validation_rules=>nil},
        {:value=>"Playoff", :validation_rules=>nil},
        {:value=>"Press Pass", :validation_rules=>nil},
        {:value=>"Pro Set", :validation_rules=>nil},
        {:value=>"Razor", :validation_rules=>nil},
        {:value=>"SAGE", :validation_rules=>nil}]},

=end

class PageController < ApplicationController
  def home

    @timestamp = Ebayr.call(:VerifyAddFixedPriceItem,
    [:Item => [
         get_item_parameters(66) <<
         [:Currency => 'USD'],
         [:Country => 'US'],
         [:ListingDuration => 'Days_3'],
         [:DispatchTimeMax => '2'],
         [:PrimaryCategory => [
              :CategoryID => '213',

          ]
         ],
         [:Location => 'Austin, TX'],
         [:PaymentMethods => 'PayPal'],
         [:PayPalEmailAddress => 'test@test.com'],
         [:StartPrice => '100'],
         get_shipping_details,
         get_return_policy
     ]
    ])

    @timestamp = Ebayr.call(:GetCategorySpecifics, [
      [:CategoryID => '213'],
    ])

    pp @timestamp
  end

  def get_category_features
    Ebayr.call(:GetCategoryFeatures, [
                                       [:AllFeaturesForCategory => 'true'],
                                       [:CategoryID => '213'],
                                       [:DetailLevel => 'ReturnAll']
                                   ])
  end

  def get_item_parameters(id)
    item = Item.find(id)
    [[:Title => item.name],
    [:Description => item.description],
    [:PictureDetails =>
        [:PrictureUrl => item.image_url]
     ]
    #[:Subtitle => item.something]
    ]
  end

  def get_return_policy
    [:ReturnPolicy => [
         :Description => 'The return policy',
         :RefundOption => 'MoneyBack',
         :ReturnsAcceptedOption => 'ReturnsAccepted',
         :ReturnsWithinOption => 'Days_14',
         :ShippingCostPaidByOption => 'Buyer'
     ]
    ]
  end

  def get_shipping_details
    [:ShippingDetails => [
         :ShippingServiceOptions => [
             :ShippingService => 'USPSPriorityMailSmallFlatRateBox',
             :ShippingServiceCost => '0'
         ]
     ]
    ]
  end

end
